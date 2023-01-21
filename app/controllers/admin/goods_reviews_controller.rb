class Admin::GoodsReviewsController < ApplicationController
  def show
    @goods_review = GoodsReview.find(params[:id])
    @goods_tags = @goods_review.goods_tags
    @goods_comments = @goods_review.goods_comments
  end

  def index
    @goods_reviews = GoodsReview.all
  end

  def destroy
    @goods_review = GoodsReview.find(params[:id])
    if @goods_review.destroy
      flash[:notice] = "レビューが削除されました"
      redirect_to admin_goods_reviews_path
    else
    @goods_review = GoodsReview.new
    render "new"
    end
  end
end
