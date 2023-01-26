class Admin::GameCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @game_comment = GameComment.find(params[:id])
    @game_comment.destroy
    redirect_to request.referer
  end
end
