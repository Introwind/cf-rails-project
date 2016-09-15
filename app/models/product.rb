class Product < ApplicationRecord
	has_many :orders
	has_many :comments
	validates :name, presence: true
	validates :price, numericality: { only_decimal: true }

	def highest_rated_comment
		comments.rating_desc.first
	end

	def lowest_rated_comment
		comments.rating_asc.first
	end

	def average_rating
		comments.average(:rating).to_f
	end

	scope :value, -> { where(price: 0..500) }

end