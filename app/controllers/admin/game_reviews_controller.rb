class Admin::GameReviewsController < ApplicationController
  def show
    @game_review = GameReview.find(params[:id])
    @game_tags = @game_review.game_tags
    @game_comments = @game_review.game_comments
  end

  def index
    @game_reviews = GameReview.all
  end

  def destroy
    @game_review = GameReview.find(params[:id])
    if @game_review.destroy
      flash[:notice] = "レビューが削除されました"
      redirect_to admin_game_reviews_path
    else
    @game_review = GameReview.new
    @genres = Genre.all
    render "new"
    end
  end
end
