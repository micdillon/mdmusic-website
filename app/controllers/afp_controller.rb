class AfpController < ApplicationController
	def frontend
		#@clients = Clients.all
		render 'frontend', :layout => false
	end
end
