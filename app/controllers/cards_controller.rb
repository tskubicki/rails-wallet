class CardsController < ApplicationController
	def new
		@card = Card.new
	end
	def create
		@card = Card.new(card_params)
		@card.users << current_user
		if @card.save
			flash[:notice] = "Your #{@card.card_type} was successfuly created!"
			redirect_to user_path(current_user)
		else
			flash[:notice] = "Errors occured. Please fix them and try again"
			render new_card_path(@card)
		end
	end
	def destroy
	end
	
	def share
		@card_to_share = params(card_to_share_params)
		
	end
	
	private
	def card_params
		params.require(:card).permit(:card_number, :expiration_month, :expiration_year, :user_id)
	end
	def card_to_share_params
		params.require(:card_to_share).permit(:id, :card_number, :expiration_month, :expiration_year, :user_id)
	end
end
