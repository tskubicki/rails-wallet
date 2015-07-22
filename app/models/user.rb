class User < ActiveRecord::Base

	validates :email, uniqueness: true
	validates :email, presence: true
	validates :password, confirmation: true
	validates_format_of :phone, with: /\A^\d{10}\z/
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :cash_balance, numericality: {greater_than: 0, message: "Balance cannot be negative"}
	

	has_many :usercards
	has_many :cards, through: :usercards
end
