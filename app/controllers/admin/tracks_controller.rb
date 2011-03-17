class Admin::TracksController < ApplicationController
  layout "admin"

  def index
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @tracks = @release.tracks

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tracks }
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @track = Track.find(params[:id]);

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @track }
    end
  end

  def new
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @track = Track.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @track }
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @track = Track.find(params[:id]);
  end

  def create
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @track = @release.tracks.create(params[:track]);

    respond_to do |format|
      if @track.save
        format.html { redirect_to([:admin, @project, @release, @track], :notice => 'Client was successfully created.') }
        format.xml  { render :xml => @track, :status => :created, :location => @track }
      else
        format.html { render :action => "new", :controller => "admin/tracks" }
        format.xml  { render :xml => @track.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @track = Track.find(params[:id]);

    respond_to do |format|
      if @track.update_attributes(params[:track])
        format.html { redirect_to([:admin, @project, @release, @track], :notice => 'Client was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit", :controller => "admin/tracks" }
        format.xml  { render :xml => @track.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @release = Release.find(params[:release_id])
    @track = Track.find(params[:id]);
    @track.destroy

    respond_to do |format|
      format.html { redirect_to([:admin, @project, @release, :tracks]) }
      format.xml  { head :ok }
    end
  end

end
