class Public::GameLikesController < ApplicationController
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
end
