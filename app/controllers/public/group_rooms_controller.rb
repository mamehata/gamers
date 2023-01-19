class Public::GroupRoomsController < ApplicationController
  def show
    @group_room = GroupRoom.find(params[:id])
    @room_members = @group_room.room_members
    @room_chats = @group_room.room_chats
    if params[:room_chat_id].nil?
      @room_chat = GroupRoom.new
    else
      @room_chat = GroupRoom.find(params[:room_chat_id])
    end
  end

  def create
    @group_room = GroupRoom.new(group_room_params)
    if @group_room.save!
      GroupMember.where(member_id: current_member.id, group_id: @group_room.group.id).first.update!(group_room_id: @group_room.id)
      flash[:notice] = "ルームが作成されました"
      redirect_to group_room_path(@group_room)
    else
      redirect_to request.referer
    end
  end

  def destroy
    @group_room = GroupRoom.find(params[:id])
    if @group_room.destroy
      flash[:notice] = "ルームを解散しました"
      redirect_to group_path(@group_room.group)
    else
      render 'show'
    end
  end

  private

  def group_room_params
    params.require(:group_room)
          .permit(:room_name, :room_owner_id, :group_id)
  end
end
