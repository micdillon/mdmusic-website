class Admin::BuylinksController < ApplicationController
  layout "admin"

  def index
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @buylinks = @release.buylinks

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @buylinks }
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @buylink = Buylink.find(params[:id]);

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @buylink }
    end
  end

  def new
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @buylink = Buylink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @buylink }
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @buylink = Buylink.find(params[:id]);
  end

  def create
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @buylink = @release.buylinks.create(params[:buylink]);

    respond_to do |format|
      if @buylink.save
        format.html { redirect_to([:admin, @project, @release, @buylink], :notice => 'Client was successfully created.') }
        format.xml  { render :xml => @buylink, :status => :created, :location => @buylink }
      else
        format.html { render :action => "new", :controller => "admin/buylinks" }
        format.xml  { render :xml => @buylink.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @buylink = Buylink.find(params[:id]);

    respond_to do |format|
      if @buylink.update_attributes(params[:buylink])
        format.html { redirect_to([:admin, @project, @release, @buylink], :notice => 'Client was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit", :controller => "admin/buylinks" }
        format.xml  { render :xml => @buylink.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @buylink = Buylink.find(params[:id]);
    @buylink.destroy

    respond_to do |format|
      format.html { redirect_to([:admin, @project, @release, :buylinks]) }
      format.xml  { head :ok }
    end
  end

end
