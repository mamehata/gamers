class Public::GameCommentsController < ApplicationController
  before_action :authenticate_member!
  before_action :confirm_contributor, except: [:create]

  def create
    @game_review = GameReview.find(params[:game_review_id])
    @game_comment = GameComment.new(game_comment_params)
    @game_comment.save
    @game_comments = @game_review.game_comments
    render "public/game_reviews/game_comment_index.js.erb"
  end

  def update
    @game_review = GameReview.find(params[:game_review_id])
    @game_comment.update(game_comment_params)
    @game_comment = GameComment.new
    @game_comments = @game_review.game_comments
    render "public/game_reviews/game_comment_update.js.erb"
  end

  def destroy
    @game_review = GameReview.find(params[:game_review_id])
    @game_comment.destroy
    @game_comment = GameComment.new
    @game_comments = @game_review.game_comments
    render "public/game_reviews/game_comment_destroy.js.erb"
  end

  private

  def game_comment_params
    params.require(:game_comment)
          .permit(:game_comment)
          .merge(member_id: current_member.id, game_review_id: params[:game_review_id])
  end

  def confirm_contributor
    @game_comment = GameComment.find(params[:id])
    if @game_comment.member_id != current_member.id
      redirect_to game_review_path(@game_comment.game_review_id)
    end
  end
end
