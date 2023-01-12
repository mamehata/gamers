class GameReviewTag < ApplicationRecord
   belongs_to :game_review
   belongs_to :game_tag

   validates :game_tag_id, uniqueness: {scope: :game_review_id}
end
