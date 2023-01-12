class Public::GoodsReviewsController < ApplicationController
  def new
    @goods_review = GoodsReview.new
  end
end
