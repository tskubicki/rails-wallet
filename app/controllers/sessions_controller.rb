class SessionsController < ApplicationController

	def index
	end
	
	def new
	end
	
	def create
		email = params[:email]
		password = params[:password]
		
		@user = User.where(email: email).first
		if @user && @user.password == password
			session[:user_id] = @user.id
			flash[:notice] = "Welcome #{@user.first_name}!"
			redirect_to user_path(@user.id)
		else
			flash[:notice] = "Wrong email or password. Please try again."
			render new_session_path
		end
	end
	
	def destroy
		session[:user_id] = nil
		flash[:notice] = "You've been logged out"
		redirect_to new_session_path
	end
	
end
