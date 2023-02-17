class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    @group_chat = GroupChat.new
    @group = Group.find_by(id: data['group_id'])
    @group_chat.group_id = data['group_id']
    @group_chat.member_id = data['current_member']
    @group_chat.group_chat = data['chat']
    @group_chat.save
    @group_chats = @group.group_chats
    ActionCable.server.broadcast('chat_channel', [group_chats: @group_chats, group_id: data['group_id']])
  end
end
