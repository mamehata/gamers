class Public::GoodsCommentsController < ApplicationController
  def create
    @goods_comment = GoodsComment.new(goods_comment_params)
    @goods_comment.save
    redirect_to request.referer
  end

  def update
    @goods_comment = GoodsComment.find(params[:id])
    @goods_comment.update(goods_comment_params)
    redirect_to goods_review_path(@goods_comment.goods_review_id)
  end

  def destroy
    @goods_comment = GoodsComment.find(params[:id])
    @goods_comment.destroy
    redirect_to request.referer
  end

  private

  def goods_comment_params
    params.require(:goods_comment)
          .permit(:goods_comment)
          .merge(member_id: current_member.id, goods_review_id: params[:goods_review_id])
  end
end
