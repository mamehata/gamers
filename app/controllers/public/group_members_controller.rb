class Public::GroupMembersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @group.members << current_member
    redirect_to group_path(@group)
  end
end
