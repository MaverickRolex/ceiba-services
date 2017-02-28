class Admin::BaseController < ApplicationController

  before_action :user_admin_validation?

  def user_admin_validation?
    redirect_to dashboards_path unless current_user.admin?
  end

end