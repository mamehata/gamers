class Public::GoodsLikesController < ApplicationController
  before_action :authenticate_member!
  before_action :like_review_confirm_contributor, except: [:index]

  def index
    @like_goods_reviews = current_member.like_goods_reviews.page(params[:page]).per(20)
  end

  def create
    @goods_like = GoodsLike.new(member_id: current_member.id, goods_review_id: params[:goods_review_id])
    @goods_like.save
    render "public/goods_reviews/goods_like_icon.js.erb"
  end

  def destroy
    @goods_like = GoodsLike.find_by(member_id: current_member.id, goods_review_id: params[:goods_review_id])
    @goods_like.destroy
    render "public/goods_reviews/goods_like_icon.js.erb"
  end

  private

  def like_review_confirm_contributor
    @goods_review = GoodsReview.find(params[:goods_review_id])
    if @goods_review.member_id == current_member.id
      redirect_to goods_review_path(@goods_review)
    end
  end
end
