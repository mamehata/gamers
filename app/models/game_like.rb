class GameLike < ApplicationRecord
  belongs_to :game_review
  belongs_to :member
end
