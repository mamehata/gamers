class Public::GameLikesController < ApplicationController
  before_action :authenticate_member!
  before_action :like_review_confirm_contributor, except: [:index]

  def index
    @like_game_reviews = current_member.like_game_reviews
  end

  def create
    @game_like = GameLike.new(member_id: current_member.id, game_review_id: params[:game_review_id])
    @game_like.save
    redirect_to request.referer
  end

  def destroy
    @game_like = GameLike.find_by(member_id: current_member.id, game_review_id: params[:game_review_id])
    @game_like.destroy
    redirect_to request.referer
  end

  private

  def like_review_confirm_contributor
    @game_review = GameReview.find(params[:game_review_id])
    if @game_review.member_id == current_member.id
      redirect_to game_review_path(@game_review)
    end
  end
end
