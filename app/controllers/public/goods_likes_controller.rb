class Public::GoodsLikesController < ApplicationController
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
end
