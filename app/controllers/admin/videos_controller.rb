class Admin::VideosController < ApplicationController

  def index
    @client = Client.find(params[:client_id])
    @videos = @client.videos

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clients }
    end
  end

  def show
    @client = Client.find(params[:client_id])
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client }
    end
  end

  def new
    @client = Client.find(params[:client_id])
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @video }
    end
  end

  def edit
    @client = Client.find(params[:client_id])
    @video = Video.find(params[:id])
  end

  def create
    @client = Client.find(params[:client_id])
    @video = @client.videos.create(params[:video])
    
    #redirect_to admin_client_path(@client)
    respond_to do |format|
      if @video.save
        format.html { redirect_to([:admin, @client, @video], :notice => 'Client was successfully created.') }
        format.xml  { render :xml => @video, :status => :created, :location => @video }
      else
        format.html { render :action => "new", :controller => "admin/videos" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @client = Client.find(params[:client_id])
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to([:admin, @client, @video], :notice => 'Client was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit", :controller => "admin/videos" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @client = Client.find(params[:client_id])
    @video = Video.find(params[:id]);
    @video.destroy

    respond_to do |format|
      format.html { redirect_to([:admin, @client, :videos]) }
      format.xml  { head :ok }
    end
  end
end
