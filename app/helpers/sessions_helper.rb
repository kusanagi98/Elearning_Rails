module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      #cant use find because if null then raise exception
      @current_user ||= Student.find_by(student_id: session[:user_id])
    end
  end
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
