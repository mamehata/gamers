class Admin::GoodsReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @goods_review = GoodsReview.find(params[:id])
    @goods_tags = @goods_review.goods_tags
    @goods_comments = @goods_review.goods_comments
  end

  def index
    if params[:search_goods_tag].present?
      @goods_tag = GoodsTag.search_goods_tag(params[:search_goods_tag])
      @goods_reviews = @goods_tag.goods_reviews.page(params[:page]).per(20)
    elsif params[:search_goods_rating].present?
      @goods_reviews = GoodsReview.search_goods_rating(params[:search_goods_rating]).page(params[:page]).per(20)
    else
      @goods_reviews = GoodsReview.page(params[:page]).per(20)
    end
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
