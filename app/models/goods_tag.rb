class GoodsTag < ApplicationRecord
  has_many :goods_review_tags, dependent: :destroy
  has_many :goods_reviews, through: :goods_review_tags

  def self.search_goods_tag(search_word)
    self.find_by_goods_tag_name(search_word)
  end
end
