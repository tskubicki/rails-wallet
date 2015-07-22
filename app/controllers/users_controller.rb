class UsersController < ApplicationController

	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "Welcome #{@user.first_name}! Sign in to continue."
			redirect_to new_session_path
		else
			flash[:notice] = "Errors occured. Please fix them and try again"
			render new_user_path
		end
	end
	
	def show
		@user = current_user
		@cards = @user.cards
	end
	
	
	
	private
	def user_params
		params.require(:user).permit(:email,
									 :password, 
									 :password_confirmation,
									 :phone,
									 :first_name,
									 :last_name,
									 :cash_balance)
	end
	
end
