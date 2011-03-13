class ContactsController < ApplicationController

	def frontend
		@contact = Contact.first
		render 'frontend', :layout => false
	end

end
