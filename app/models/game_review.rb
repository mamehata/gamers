class GameReview < ApplicationRecord
  has_many :game_review_tags, dependent: :destroy
  has_many :game_tags, through: :game_review_tags
  has_many :game_comments, dependent: :destroy
  belongs_to :genre

  validates :game_title, :game_summary, :game_impression, :game_price, :game_rating, :genre, presence: true
  validates :game_price, numericality: true
end
