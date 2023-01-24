class Public::GameReviewsController < ApplicationController
  before_action :authenticate_member!, only: [:new, :create]
  before_action :confirm_contributor, only: [:update, :destroy]

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
    if !params[:search_game_genre].empty?
      @game_genre = Genre.search_game_genre(params[:search_game_genre])
      @game_reviews = @game_genre.game_reviews.page(params[:page]).per(20)
    elsif !params[:search_game_tag].empty?
      @game_tag = GameTag.search_game_tag(params[:search_game_tag])
      @game_reviews = @game_tag.game_reviews.page(params[:page]).per(20)
    elsif !params[:search_game_rating].empty?
      @game_reviews = GameReview.search_game_rating(params[:search_game_rating]).page(params[:page]).per(20)
    else
      @game_reviews = GameReview.page(params[:page]).per(20)
    end
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

  def update

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

  def confirm_contributor
    @game_review = GameReview.find(params[:id])
    if @game_review.member_id != current_member.id
      redirect_to game_review_path(@game_review)
    end
  end
end
