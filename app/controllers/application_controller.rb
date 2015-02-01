class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_login
    unless current_user
      redirect_to 'http://localhost:3000/login'
    end
  end

  def require_admin
  	unless current_user.admin?
  		redirect_to 'http://localhost:3000'
  	end
  end
  
end
