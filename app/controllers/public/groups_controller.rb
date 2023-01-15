class Public::GroupsController < ApplicationController

  def show

  end

  def create
    @group = Group.new(group_params)
    @group.members << current_member
   
    if @group.save
      flash[:notice] = "グループが作成されました"
      redirect_to group_path(@group)
    else
    @group = Group.new
    @game_review = GameReview.find(params[:id])
    @game_tags = @game_review.game_tags
    @game_comments = @game_review.game_comments
    redirect_to game_review_path(@group.game_review)
    end
  end

  private

  def group_params
    params.require(:group)
          .permit(:group_name, :group_introduction, :game_review_id, :group_owner_id)
  end
end
