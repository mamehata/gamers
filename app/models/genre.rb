class Genre < ApplicationRecord
  has_many :game_reviews, dependent: :destroy
end
