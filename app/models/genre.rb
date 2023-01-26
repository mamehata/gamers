class Genre < ApplicationRecord
  has_many :game_reviews, dependent: :destroy

  validates  :genre_name, presence: true

  def self.search_game_genre(search_word)
    self.find_by_genre_name(search_word)
  end
end
