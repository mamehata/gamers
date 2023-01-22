class Public::GameReviewsController < ApplicationController
  def new
    @game_review = GameReview.new
    @genres = Genre.all
  end

  def show
    @group = Group.new
    @game_review = GameReview.find(params[:id])
    @game_tags = @game_review.game_tags
    @game_comments = @game_review.game_comments
    if params[:game_comment_id].nil?
      @game_comment = GameComment.new
    else
      @game_comment = GameComment.find(params[:game_comment_id])
    end
  end

  def index
    @game_reviews = GameReview.page(params[:page]).per(20)
  end

  def create
    @game_review = GameReview.new(game_review_params.except(:game_tag_name))
    @game_review.member_id = current_member.id
    game_tags = params[:game_review][:game_tag_name].split(/[\A[:space:]\z]/)
    if @game_review.save
      @game_review.save_tag(game_tags)
      flash[:notice] = "レビューが投稿されました"
      redirect_to game_review_path(@game_review)
    else
      @genres = Genre.all
      render "new"
    end
  end

  def destroy
    @game_review = GameReview.find(params[:id])
    if @game_review.destroy
      flash[:notice] = "レビューが削除されました"
      redirect_to new_game_review_path
    else
    @game_review = GameReview.new
    @genres = Genre.all
    render "new"
    end
  end

  private

  def game_review_params
    params.require(:game_review)
          .permit(:game_title, :game_summary, :game_impression, :game_price, :game_rating, :genre_id, :game_tag_name)
  end
end
