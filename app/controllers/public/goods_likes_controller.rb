class Public::GoodsLikesController < ApplicationController
  before_action :authenticate_member!
  before_action :like_review_confirm_contributor, except: [:index]

  def index
    @like_goods_reviews = current_member.like_goods_reviews
  end

  def create
    @goods_like = GoodsLike.new(member_id: current_member.id, goods_review_id: params[:goods_review_id])
    @goods_like.save
    redirect_to request.referer
  end

  def destroy
    @goods_like = GoodsLike.find_by(member_id: current_member.id, goods_review_id: params[:goods_review_id])
    @goods_like.destroy
    redirect_to request.referer
  end

  private

  def like_review_confirm_contributor
    @goods_review = GoodsReview.find(params[:goods_review_id])
    if @goods_review.member_id == current_member.id
      redirect_to goods_review_path(@goods_review)
    end
  end
end
