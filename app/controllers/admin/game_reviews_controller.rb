class Admin::GameReviewsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @game_review = GameReview.find(params[:id])
    @game_tags = @game_review.game_tags
    @game_comments = @game_review.game_comments
  end

  def index
    if params[:search_game_genre].present?
      @game_genre = Genre.search_game_genre(params[:search_game_genre])
      @game_reviews = @game_genre.game_reviews.page(params[:page]).per(20)
    elsif params[:search_game_tag].present?
      @game_tag = GameTag.search_game_tag(params[:search_game_tag])
      @game_reviews = @game_tag.game_reviews.page(params[:page]).per(20)
    elsif params[:search_game_rating].present?
      @game_reviews = GameReview.search_game_rating(params[:search_game_rating]).page(params[:page]).per(20)
    else
      @game_reviews = GameReview.page(params[:page]).per(20)
    end
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
