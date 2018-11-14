class DashboardsController < ApplicationController

  def show
    @cluck = Cluck.new
    @clucks = current_user.clucks
  end

end