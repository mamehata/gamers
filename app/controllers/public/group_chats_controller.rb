class Public::GroupChatsController < ApplicationController
  before_action :authenticate_member!
  before_action :confirm_contributor, except: [:create]
  after_action :create_notifications, only: [:create]

  def create
    @group = Group.find(params[:group_id])
    @group_chat = GroupChat.new(group_chat_params)
    @group_chat.save
    @group_chats = @group.group_chats
    render "public/groups/group_comment_index.js.erb"
  end

  def update
    @group = Group.find(params[:group_id])
    @group_chat = GroupChat.find(params[:id])
    @group_chat.update(group_chat_params)
    @group_chat = GroupChat.new
    @group_chats = @group.group_chats
    render "public/groups/group_comment_update.js.erb"
  end

  def destroy
    @group = Group.find(params[:group_id])
    @group_chat = GroupChat.find(params[:id])
    @group_chat.destroy
    @group_chat = GroupChat.new
    @group_chats = @group.group_chats
    render "public/groups/group_comment_destroy.js.erb"
  end

  private

  def group_chat_params
    params.require(:group_chat)
          .permit(:group_chat)
          .merge(member_id: current_member.id, group_id: params[:group_id])
  end

  def confirm_contributor
    @group_chat = GroupChat.find(params[:id])
    if @group_chat.member_id != current_member.id
      redirect_to group_path(@group_chat.group_id)
    end
  end

  def create_notifications
    @group_members = GroupMember.where(group_id: Group.find(params[:group_id]))
    @not_self_group_members = @group_members.where.not(member_id: current_member)
    @not_self_group_members.each do |not_self_group_member|
      Notification.create(member_id: not_self_group_member.member_id, group_chat_id: @group_chat.id, group_id: Group.find(params[:group_id]).id)
    end
  end
end
