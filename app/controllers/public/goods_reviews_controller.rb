class Public::GoodsReviewsController < ApplicationController
  def new
    @goods_review = GoodsReview.new
  end

  def show
    @goods_review = GoodsReview.find(params[:id])
    @goods_tags = @goods_review.goods_tags
    @goods_comments = @goods_review.goods_comments
    if params[:goods_comment_id].nil?
      @goods_comment = GoodsComment.new
    else
      @goods_comment = GoodsComment.find(params[:goods_comment_id])
    end
  end

  def index
    @goods_reviews = GoodsReview.page(params[:page]).per(20)
  end

  def create
    @goods_review = GoodsReview.new(goods_review_params.except(:goods_tag_name))
    @goods_review.member_id = current_member.id
    goods_tags = params[:goods_review][:goods_tag_name].split(' ')
    if @goods_review.save
      @goods_review.save_tag(goods_tags)
      flash[:notice] = "レビューが投稿されました"
      redirect_to goods_review_path(@goods_review)
    else
      render "new"
    end
  end

  def destroy
    @goods_review = GoodsReview.find(params[:id])
    if @goods_review.destroy
      flash[:notice] = "レビューが削除されました"
      redirect_to new_goods_review_path
    else
    @goods_review = GoodsReview.new
    render "new"
    end
  end

  private

  def goods_review_params
    params.require(:goods_review)
          .permit(:goods_name, :goods_summary, :goods_impression, :goods_price, :goods_rating, :goods_tag_name)
  end
end
