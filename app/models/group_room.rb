class GroupRoom < ApplicationRecord
  has_many :room_chats, dependent: :destroy
  has_many :room_chat_members, through: :room_chats, source: :group_member
  has_many :group_members, dependent: :destroy
  has_many :room_members, through: :group_members, source: :member
  belongs_to :group
  belongs_to :room_owner, class_name: 'Member', foreign_key: :room_owner_id

  validates :room_owner_id, :room_name, :group_id, presence: true
end