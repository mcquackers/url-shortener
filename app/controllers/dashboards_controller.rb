class DashboardsController < ApplicationController
  skip_before_action :require_login

  def show
    if signed_in?
      @user = current_user
    end
  end
end
