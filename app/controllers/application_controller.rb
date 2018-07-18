class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authorize!
  add_flash_types :success, :info, :warning, :danger

  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  private

  def authorize!
    permission = PermissionService.new(current_user, params[:controller], params[:action])
    raise ActionController::RoutingError.new('Not Found') unless permission.authorized?
  end
end
