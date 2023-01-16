class GroupRoom < ApplicationRecord
  has_many :room_chats, dependent: :destroy
  has_many :group_members, through: :room_chats
  has_many :group_members
  belongs_to :group
end
