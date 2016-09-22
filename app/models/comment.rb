class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :body, presence: true #won't save if blank form :body
  	validates :user, presence: true #makes sure a user is logged in before
  	validates :product, presence: true #makes sure a product is valid
  	validates :rating, numericality: { only_integer: true } #makes sure a rating has been given
  after_create_commit { CommentUpdateJob.perform_later(self, @user) }

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(:rating) }
end
