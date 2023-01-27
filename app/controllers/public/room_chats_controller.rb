class Public::RoomChatsController < ApplicationController
  before_action :authenticate_member!
  before_action :confirm_contributor, except: [:create]

  def create
    @group_room = GroupRoom.find(params[:group_room_id])
    @room_chat = RoomChat.new(room_chat_params)
    @room_chat.save
    @room_chats = @group_room.room_chats
    render "public/group_rooms/room_comment_index.js.erb"
  end

  def update
    @group_room = GroupRoom.find(params[:group_room_id])
    @room_chat = RoomChat.find(params[:id])
    @room_chat.update(room_chat_params)
    @room_chat = RoomChat.new
    @room_chats = @group_room.room_chats
    render "public/group_rooms/room_comment_update.js.erb"
  end

  def destroy
    @group_room = GroupRoom.find(params[:group_room_id])
    @room_chat = RoomChat.find(params[:id])
    @room_chat.destroy
    @room_chats = @group_room.room_chats
    render "public/group_rooms/room_comment_index.js.erb"
  end

  private

  def room_chat_params
    params.require(:room_chat)
          .permit(:room_chat)
          .merge(member_id: current_member.id, group_room_id: params[:group_room_id], group_member_id: GroupMember.find_by(group_id: GroupRoom.find(params[:group_room_id]).group.id, member_id: current_member.id).id)
  end

  def confirm_contributor
    @room_chat = RoomChat.find(params[:id])
    if @room_chat.group_member_id != current_member.id
      redirect_to group_room_path(@room_chat.group_room_id)
    end
  end
end
