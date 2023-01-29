class Public::GroupRoomsController < ApplicationController
  before_action :authenticate_member!
  before_action :room_member_confirm, except: [:create]

  def show
    @group_room = GroupRoom.find(params[:id])
    @room_members = @group_room.room_members.page(params[:page]).per(5)
    @room_chats = @group_room.room_chats
    if params[:room_chat_id].nil?
      @room_chat = RoomChat.new
    else
      @room_chat = RoomChat.find(params[:room_chat_id])
    end
    respond_to do |format|
      format.html
      format.js { render "public/group_rooms/room_comment_update_form.js.erb" }
    end
  end

  def create
    @group_room = GroupRoom.new(group_room_params)
    respond_to do |format|
      if @group_room.save
        GroupMember.where(member_id: current_member.id, group_id: @group_room.group.id).first.update(group_room_id: @group_room.id)
        flash[:notice] = "ルームが作成されました"
        format.html { redirect_to group_room_path(@group_room) }
      else
        format.js { render 'public/groups/room_create_error.js.erb' }
      end
    end
  end

  def update
    @group_room = GroupRoom.find(params[:id])
    respond_to do |format|
      if @group_room.update(group_room_params)
        flash[:notice] = "ルームを編集しました。"
        format.html { redirect_to group_room_path(@group_room) }
      else
        format.js { render 'public/group_rooms/room_update_error.js.erb' }
      end
    end
  end

  def destroy
    @group_room = GroupRoom.find(params[:id])
    GroupMember.where(group_room_id: @group_room).all.update(group_room_id: nil)
    if @group_room.destroy
      flash[:notice] = "ルームを解散しました"
      redirect_to group_path(@group_room.group_id)
    else
      @room_members = @group_room.room_members
      @room_chats = @group_room.room_chats
      @room_chat = RoomChat.new
      render 'show'
    end
  end

  private

  def group_room_params
    params.require(:group_room)
          .permit(:room_name, :room_owner_id, :group_id)
  end

  def room_member_confirm
    @group_room = GroupRoom.find(params[:id])
    unless GroupMember.exists?(member_id: current_member, group_id: @group_room.group_id, group_room_id: @group_room)
      redirect_to group_path(@group_room.group_id)
    end
  end
end
