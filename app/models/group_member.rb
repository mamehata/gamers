class GroupMember < ApplicationRecord
  has_many :room_chats, dependent: :destroy
  has_many :chat_group_rooms, through: :room_chats
  belongs_to :group
  belongs_to :member
  belongs_to :group_room, optional: true

  validates :member_id, uniqueness: { scope: :group_id }
  validates :group_room_id, uniqueness: { scope: [:group_id, :member_id] }
end
