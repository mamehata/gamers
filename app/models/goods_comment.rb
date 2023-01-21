class GoodsComment < ApplicationRecord
  belongs_to :goods_review
  belongs_to :member
end
