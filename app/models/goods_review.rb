class GoodsReview < ApplicationRecord
  has_many :goods_review_tags, dependent: :destroy
  has_many :goods_tags, through: :goods_review_tags
  has_many :goods_likes, dependent: :destroy
  has_many :members, through: :goods_likes
  has_many :goods_comments, dependent: :destroy
  belongs_to :member

  validates :goods_name, :goods_summary, :goods_impression, :goods_price, :goods_rating, presence: true
  validates :goods_price, numericality: true

  def save_tag(goods_tags)
    unless self.goods_tags.nil?
      current_tags = self.goods_tags.pluck(:goods_tag_name)
    end
    old_tags = current_tags - goods_tags
    new_tags = goods_tags - current_tags
    old_tags.each do |old_tag|
      self.goods_tags.delete(GoodsTag.find_by(goods_tag_name: old_tag))
    end
    new_tags.each do |new_tag|
      add_tags = GoodsTag.find_or_create_by(goods_tag_name: new_tag)
      self.goods_tags << add_tags
    end
  end

  def goods_likes?(member)
    self.goods_likes.where(member_id: member.id).exists?
  end
end
