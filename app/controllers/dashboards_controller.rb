class DashboardsController < ApplicationController
  skip_before_action :require_login

  def show
    if signed_in?
      @user = current_user
      @links = @user.links
    else
      @links = []
    end
  end
end
