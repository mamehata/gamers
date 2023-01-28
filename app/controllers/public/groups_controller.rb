class Public::GroupsController < ApplicationController
  before_action :authenticate_member!
  before_action :group_member_confirm, except: [:create]
  before_action :group_owner_confirm, only: [:update, :destroy]

  def show
    @group_room = GroupRoom.new
    @group = Group.find(params[:id])
    @group_members = @group.members.page(params[:page]).per(10)
    @group_rooms = @group.group_rooms.page(params[:page]).per(10)
    @group_chats = @group.group_chats
    @group_chats.each do |group_chat|
      notification = current_member.notifications.find_by_group_chat_id(group_chat)
      if !notification.nil?
        unless notification.see?
          notification.update(see: true)
        end
      end
    end
    if params[:group_chat_id].nil?
      @group_chat = GroupChat.new
    else
      @group_chat = GroupChat.find(params[:group_chat_id])
    end
    respond_to do |format|
      format.html
      format.js { render "public/groups/group_comment_update_form.js.erb" }
    end
  end

  def create
    @group = Group.new(group_params)
    @group.members << current_member
    respond_to do |format|
      if @group.save
        flash[:notice] = "グループが作成されました"
        format.html { redirect_to group_path(@group) }
      else
        format.js { render 'public/game_reviews/group_create_error.js.erb' }
      end
    end
  end

  def update
    @group = Group.find(params[:id])
    respond_to do |format|
      if @group.update(group_params)
        flash[:notice] = "グループを編集しました。"
        format.html { redirect_to group_path(@group) }
      else
        format.js { render 'public/groups/group_update_error.js.erb' }
      end
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

  def group_member_confirm
    @group = Group.find(params[:id])
    unless GroupMember.exists?(member_id: current_member, group_id: @group)
      redirect_to member_path(current_member)
    end
  end

  def group_owner_confirm
    @group = Group.find(params[:id])
    unless @group.group_owner_id == current_member.id
      redirect_to group_path(@group)
    end
  end
end
