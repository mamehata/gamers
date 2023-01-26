class Public::GoodsReviewsController < ApplicationController
  before_action :authenticate_member!, only: [:new, :create]
  before_action :confirm_contributor, only: [:update, :destroy]

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
    if params[:search_goods_tag].present?
      @source = "タグ"
      @word = params[:search_goods_tag]
      @goods_tag = GoodsTag.search_goods_tag(params[:search_goods_tag])
      @goods_reviews = @goods_tag.goods_reviews.page(params[:page]).per(20)
    elsif params[:search_goods_rating].present?
      @source = "評価"
      @word = params[:search_goods_rating]
      @goods_reviews = GoodsReview.search_goods_rating(params[:search_goods_rating]).page(params[:page]).per(20)
    else
      @goods_reviews = GoodsReview.page(params[:page]).per(20)
    end
  end

  def create
    @goods_review = GoodsReview.new(goods_review_params.except(:goods_tag_name))
    @goods_review.member_id = current_member.id
    goods_tags = params[:goods_review][:goods_tag_name].split(/\A[[:space:]]\z/)
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

  def confirm_contributor
    @goods_review = GoodsReview.find(params[:id])
    if @goods_review.member_id != current_member.id
      redirect_to goods_review_path(@goods_review)
    end
  end
end
