class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :ckeck_admin

  protected

  def ckeck_admin
    redirect_to root_path, alert: 'У вас нет прав' unless current_user.admin?
  end

end
