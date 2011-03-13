class AfpController < ApplicationController
	def frontend
		@clients = Client.all
		render 'frontend', :layout => false
	end
end
