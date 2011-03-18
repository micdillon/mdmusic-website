class DiscogController < ApplicationController

  def frontend
    @projects = Project.all(:order => "name ASC")
  end

end
