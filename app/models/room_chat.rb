class RoomChat < ApplicationRecord
  belongs_to :group_room
  belongs_to :group_member, optional: true
  belongs_to :member, class_name: 'Member', foreign_key: "member_id"

  validates :room_chat, presence: true
end
