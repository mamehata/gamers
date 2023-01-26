class GoodsComment < ApplicationRecord
  belongs_to :goods_review
  belongs_to :member
  
  validates :goods_comment, presence: true
end
