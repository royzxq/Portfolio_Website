class AccessController < ApplicationController

before_action :confirm_loggin, :except => [:login, :attempt_login, :logout]

  def index
  	@page_title = "Admin Menu"
  end

  def login
  	@page_title = "Login page"
  end

  def attempt_login
  	if params[:username].present? and params[:password].present?
  		found_user = AdminUser.where(:username => params[:username]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end

  	if authorized_user
  		session[:username] = authorized_user.username
  		flash[:notice] = "You are logged in"
  		# redirect_to accesses_path
  		redirect_to :action => "index"
  	else
  		flash[:notice] = "Invalid username or password"
  		redirect_to :action => 'login'
  	end
  end

  def logout
  	session[:username] = nil
  	flash[:notice] = "logged out"
  	redirect_to :action => 'login'
  end
  
private

end
