class Admin::ReleasesController < ApplicationController
  layout "admin"

  def index
    @project = Project.find(params[:project_id])
    @releases = @project.releases

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @releases }
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:id]);

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @release }
    end
  end

  def new
    @project = Project.find(params[:project_id])
    @release = Release.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @release }
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:id]);
  end

  def create
    @project = Project.find(params[:project_id])
    @release = @project.releases.create(params[:release]);

    respond_to do |format|
      if @release.save
        format.html { redirect_to([:admin, @project, @release], :notice => 'Client was successfully created.') }
        format.xml  { render :xml => @release, :status => :created, :location => @release }
      else
        format.html { render :action => "new", :controller => "admin/releases" }
        format.xml  { render :xml => @release.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:id]);

    respond_to do |format|
      if @release.update_attributes(params[:release])
        format.html { redirect_to([:admin, @project, @release], :notice => 'Client was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit", :controller => "admin/releases" }
        format.xml  { render :xml => @release.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:id]);
    @release.destroy

    respond_to do |format|
      format.html { redirect_to([:admin, @project, :releases]) }
      format.xml  { head :ok }
    end
  end

end
