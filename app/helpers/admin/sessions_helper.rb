module Admin::SessionsHelper

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  # Logs in the given user.
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  # Returns the current logged-in user (if any).
  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_admin.nil?
  end
end