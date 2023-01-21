class Public::GroupMembersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @group.members << current_member
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:group_id])
    @group.members.destroy(current_member)
    redirect_to member_path(current_member)
  end
end
