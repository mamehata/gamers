class GroupMember < ApplicationRecord
  has_many :room_members, dependent: :destroy
  has_many :group_rooms, through: :room_members
  has_many :room_chats, dependent: :destroy
  has_many :chat_group_rooms, through: :game_review_tags
  belongs_to :group
  belongs_to :member
end
