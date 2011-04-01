class Admin::VideosController < ApplicationController
  layout "admin"

  def index
    @video_group = VideoGroup.find(params[:video_group_id])
    @videos = @video_group.videos

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @video_groups }
    end
  end

  def show
    @video_group = VideoGroup.find(params[:video_group_id])
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @video_group }
    end
  end

  def new
    @video_group = VideoGroup.find(params[:video_group_id])
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @video }
    end
  end

  def edit
    @video_group = VideoGroup.find(params[:video_group_id])
    @video = Video.find(params[:id])
  end

  def create
    @video_group = VideoGroup.find(params[:video_group_id])
    @video = @video_group.videos.create(params[:video])
    
    #redirect_to admin_video_group_path(@video_group)
    respond_to do |format|
      if @video.save
        format.html { redirect_to([:admin, @video_group, @video], :notice => 'VideoGroup was successfully created.') }
        format.xml  { render :xml => @video, :status => :created, :location => @video }
      else
        format.html { render :action => "new", :controller => "admin/videos" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @video_group = VideoGroup.find(params[:video_group_id])
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to([:admin, @video_group, @video], :notice => 'VideoGroup was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit", :controller => "admin/videos" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @video_group = VideoGroup.find(params[:video_group_id])
    @video = Video.find(params[:id]);
    @video.destroy

    respond_to do |format|
      format.html { redirect_to([:admin, @video_group, :videos]) }
      format.xml  { head :ok }
    end
  end
end
