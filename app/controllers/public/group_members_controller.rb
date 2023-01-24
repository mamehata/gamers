class Public::GroupMembersController < ApplicationController
  before_action :authenticate_member!

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

  def room_create
    @group_room = GroupRoom.find(params[:id])
    GroupMember.where(member_id: current_member.id, group_id: @group_room.group.id).first.update(group_room_id: @group_room.id)
    flash[:notice] = "ルームに参加しました"
    redirect_to group_room_path(@group_room)
  end

  def room_destroy
    @group_room = GroupRoom.find(params[:id])
    GroupMember.where(member_id: current_member.id, group_id: @group_room.group_id).first.update(group_room_id: nil)
    flash[:notice] = "ルームを退出しました"
    redirect_to group_path(@group_room.group_id)
  end
end
