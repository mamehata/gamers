class GameReview < ApplicationRecord
  has_many :game_review_tags, dependent: :destroy
  has_many :game_tags, through: :game_review_tags
  has_many :game_likes, dependent: :destroy
  has_many :members, through: :game_likes
  has_many :game_comments, dependent: :destroy
  belongs_to :genre
  belongs_to :member
  has_one :group, dependent: :destroy, class_name: 'Group'

  validates :game_title, :game_summary, :game_impression, :game_price, :game_rating, :genre_id, presence: true
  validates :game_price, numericality: true

  def save_tag(game_tags)
    unless self.game_tags.nil?
      current_tags = self.game_tags.pluck(:game_tag_name)
    end
    old_tags = current_tags - game_tags
    new_tags = game_tags - current_tags
    old_tags.each do |old_tag|
      self.game_tags.delete(GameTag.find_by(game_tag_name: old_tag))
    end
    new_tags.each do |new_tag|
      add_tags = GameTag.find_or_create_by(game_tag_name: new_tag)
      self.game_tags << add_tags
    end
  end

  def game_likes?(member)
    self.game_likes.where(member_id: member.id).exists?
  end

  def self.search_game_review(search_word)
    self.where('game_title LIKE?', "%#{search_word}%")
  end

  def self.search_game_rating(search_word)
    self.where(game_rating: search_word)
  end
end
