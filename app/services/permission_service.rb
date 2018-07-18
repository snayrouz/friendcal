class PermissionService
  def initialize(user, controller, action)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def authorized?
    return true if controller == "users" && action.in?(%w(new update create))
    return true if controller == "sessions" && action.in?(%w(new create destroy))
    if user.platform_admin?
      return true if controller == "users" && action.in?(%w(index destroy create new update edit))
      return true if controller == "main" && action.in?(%w(index))
    elsif user
      return true if controller == "main" && action.in?(%w(index))
      return true if controller == "users" && action.in?(%w(update destroy edit))
    else
      return false
    end
  end

  private

    attr_reader :user, :controller, :action
end