class GroupChat < ApplicationRecord
  after_create_commit :create_notifications

  belongs_to :group
  belongs_to :member
  has_many :notifications, dependent: :destroy

  validates :group_chat, presence: true

  private

  def create_notifications
    byebug
    @group_members = GroupMember.where(group_id: Group.find(params[:group_id]))
    @not_self_group_members = @group_members.where.not(member_id: current_member)
    @not_self_group_members.each do |not_self_group_member|
      Notification.create(member_id: not_self_group_member.member_id, group_chat_id: @group_chat.id, group_id: Group.find(params[:group_id]).id)
    end
  end
end
