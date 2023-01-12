class GameTag < ApplicationRecord
  has_many :game_review_tags, dependent: :destroy
end
