class GameTag < ApplicationRecord
  has_many :game_review_tags, dependent: :destroy
  has_many :game_reviews, through: :game_review_tags

  def self.search_game_tag(search_word)
    self.find_by_game_tag_name(search_word)
  end
end
