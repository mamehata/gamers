class Public::GroupChatsController < ApplicationController
  before_action :authenticate_member!
  before_action :confirm_contributor, except: [:create]

  def create
    @group_chat = GroupChat.new(group_chat_params)
    if @group_chat.save
      redirect_to request.referer
    else
      redirect_to group_path(@group_chat.group)
    end
  end

  def update
    @group_chat = GroupChat.find(params[:id])
    @group_chat.update(group_chat_params)
    redirect_to group_path(@group_chat.group)
  end

  def destroy
    @group_chat = GroupChat.find(params[:id])
    @group_chat.destroy
    redirect_to request.referer
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
end
