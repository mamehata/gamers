class GoodsTag < ApplicationRecord
  has_many :goods_review_tags, dependent: :destroy
end
