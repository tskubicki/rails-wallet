class Card < ActiveRecord::Base

	before_save :autofill_card_type
	
	validates_format_of :card_number, with: /\A[3456]\d{11,}\z/
	validates_format_of :expiration_year, with: /\A^\d{4}$\z/
	validates :expiration_year, numericality: {greater_than: Time.now.year, message: "Year is invalid"}
	validates :expiration_month, inclusion: {in: (1..12)}
	validates :expiration_month, numericality: true
	
	has_many :usercards
	has_many :users, through: :usercards
	
	private
	def autofill_card_type
		case self.card_number[0]
		when '3'
			self.card_type = "AMEX"
		when '4'
			self.card_type = "Visa"
		when '5'
			self.card_type = "Mastercard"
		when '6'
			self.card_type = "Discover"
		else
			self.card_type = "Other"
		end
	end
end
