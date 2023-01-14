class GoodsReviewTag < ApplicationRecord
   belongs_to :goods_review
   belongs_to :goods_tag

   validates :goods_tag_id, uniqueness: {scope: :goods_review_id}
end
