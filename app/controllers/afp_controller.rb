class AfpController < ApplicationController

	def frontend
		@clients = Client.all(:order => "name ASC")
		render 'frontend', :layout => false
	end

  def video
    @video = Video.find(params[:id])
		render 'video', :layout => false
  end

end
