class Public::GameCommentsController < ApplicationController
  def create
    @game_comment = GameComment.new(game_comment_params)
    @game_comment.save
    redirect_to request.referer
  end

  def update
    @game_comment = GameComment.find(params[:id])
    @game_comment.update(game_comment_params)
    redirect_to game_review_path(@game_comment.game_review_id)
  end

  def destroy
    @game_comment = GameComment.find(params[:id])
    @game_comment.destroy
    redirect_to request.referer
  end

  private

  def game_comment_params
    params.require(:game_comment)
          .permit(:game_comment)
          .merge(member_id: current_member.id, game_review_id: params[:game_review_id])
  end
end
