class AdminController < ApplicationController
  layout "admin"

  USERS = {"mic.dillon" => "Sc13nc3!"}
  before_filter :authenticate

  def index
  end

  private

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

end
