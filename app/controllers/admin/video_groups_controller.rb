class Admin::VideoGroupsController < ApplicationController
  layout "admin"

  def index
    @video_groups = VideoGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @video_groups }
    end
  end

  def show
    @video_group = VideoGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @video_group }
    end
  end

  def new
    @video_group = VideoGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @video_group }
    end
  end

  def edit
    @video_group = VideoGroup.find(params[:id])
  end

  def create
    @video_group = VideoGroup.new(params[:video_group])

    respond_to do |format|
      if @video_group.save
        format.html { redirect_to([:admin, @video_group], :notice => 'VideoGroup was successfully created.') }
        format.xml  { render :xml => @video_group, :status => :created, :location => @video_group }
      else
        format.html { render :action => "new", :controller => "admin/video_groups" }
        format.xml  { render :xml => @video_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @video_group = VideoGroup.find(params[:id])

    respond_to do |format|
      if @video_group.update_attributes(params[:video_group])
        format.html { redirect_to([:admin, @video_group], :notice => 'VideoGroup was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit", :controller => "admin/video_groups" }
        format.xml  { render :xml => @video_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @video_group = VideoGroup.find(params[:id])
    @video_group.destroy

    respond_to do |format|
      format.html { redirect_to(admin_video_groups_url) }
      format.xml  { head :ok }
    end
  end
end
