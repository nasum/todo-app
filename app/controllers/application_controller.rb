class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    unless session[:user_id]
      return nil
    end

    @current_user = User.find(session[:user_id])
  end
end
