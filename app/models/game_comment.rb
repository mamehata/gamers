class GameComment < ApplicationRecord
  belongs_to :game_review
  belongs_to :member

  validates :game_comment, presence: true
end
