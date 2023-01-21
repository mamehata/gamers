class Admin::GoodsCommentsController < ApplicationController
  def destroy
    @goods_comment = GoodsComment.find(params[:id])
    @goods_comment.destroy
    redirect_to request.referer
  end
end
