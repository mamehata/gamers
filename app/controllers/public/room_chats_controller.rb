class Public::RoomChatsController < ApplicationController
  def create
    @room_chat = RoomChat.new(room_chat_params)
    if @room_chat.save
      redirect_to request.referer
    else
      redirect_to group_room_path(@room_chat.group)
    end
  end

  def update
    @room_chat = RoomChat.find(params[:id])
    @room_chat.update(group_chat_params)
    redirect_to group_room_path(@room_chat.group)
  end

  def destroy
    @room_chat = RoomChat.find(params[:id])
    @room_chat.destroy
    redirect_to request.referer
  end

  private

  def room_chat_params
    params.require(:room_chat)
          .permit(:room_chat)
          .merge(group_member_id: current_member.id, group_room_id: params[:group_room_id])
  end
end
