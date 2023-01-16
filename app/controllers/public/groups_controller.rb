class Public::GroupsController < ApplicationController

  def show
    @group_room = GroupRoom.new
    @group = Group.find(params[:id])
    @group_members = @group.members
    @group_rooms = @group.group_rooms
    @group_chats = @group.group_chats
    if params[:group_chat_id].nil?
      @group_chat = GroupChat.new
    else
      @group_chat = GroupChat.find(params[:group_chat_id])
    end
  end

  def create
    @group = Group.new(group_params)
    @group.members << current_member
    if @group.save
      flash[:notice] = "グループが作成されました"
      redirect_to group_path(@group)
    else
      redirect_to game_review_path(@group.game_review_id)
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to request.referer
    else
      @group_room = GroupRoom.new
      @group_members = @group.members
      @group_rooms = @group.group_rooms
      @group_chats = @group.group_chats
      render 'show'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to member_path(@group.group_owner_id)
    else
      @group_room = GroupRoom.new
      @group_members = @group.members
      @group_rooms = @group.group_rooms
      @group_chats = @group.group_chats
      render 'show'
    end
  end

  private

  def group_params
    params.require(:group)
          .permit(:group_name, :group_introduction, :game_review_id, :group_owner_id)
  end
end
