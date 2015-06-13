class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def confirm_loggin
  	unless session[:username]
  		redirect_to controller: "access", action: "login", notice: "Please login first" 
  		return false
  	else
  		return true
  	end
  end

  def count_subject
      @subject_count = Subject.count
  end
  
end
