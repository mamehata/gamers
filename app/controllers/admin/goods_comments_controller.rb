class Admin::GoodsCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    @goods_comment = GoodsComment.find(params[:id])
    @goods_comment.destroy
    redirect_to request.referer
  end
end
