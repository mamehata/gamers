class Public::GoodsCommentsController < ApplicationController
  before_action :authenticate_member!
  before_action :confirm_contributor, except: [:create]

  def create
    @goods_review = GoodsReview.find(params[:goods_review_id])
    @goods_comment = GoodsComment.new(goods_comment_params)
    @goods_comment.save
    @goods_comments = @goods_review.goods_comments
    render "public/goods_reviews/goods_comment_index.js.erb"
  end

  def update
    @goods_review = GoodsReview.find(params[:goods_review_id])
    @goods_comment = GoodsComment.find(params[:id])
    @goods_comment.update(goods_comment_params)
    @goods_comment = GoodsComment.new
    @goods_comments = @goods_review.goods_comments
    render "public/goods_reviews/goods_comment_update.js.erb"
  end

  def destroy
    @goods_review = GoodsReview.find(params[:goods_review_id])
    @goods_comment = GoodsComment.find(params[:id])
    @goods_comment.destroy
    @goods_comment = GoodsComment.new
    @goods_comments = @goods_review.goods_comments
    render "public/goods_reviews/goods_comment_destroy.js.erb"
  end

  private

  def goods_comment_params
    params.require(:goods_comment)
          .permit(:goods_comment)
          .merge(member_id: current_member.id, goods_review_id: params[:goods_review_id])
  end

  def confirm_contributor
    @goods_comment = GoodsComment.find(params[:id])
    if @goods_comment.member_id != current_member.id
      redirect_to goods_review_path(@goods_comment.goods_review_id)
    end
  end
end
