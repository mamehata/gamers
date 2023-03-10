class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :members, through: :group_members
  has_many :group_chats, dependent: :destroy
  has_many :chat_members, through: :group_chats, source: :member
  has_many :group_rooms, dependent: :destroy
  belongs_to :game_review
  belongs_to :group_owner, class_name: 'Member', foreign_key: :group_owner_id
  has_many :notifications, dependent: :destroy

  validates :group_name, presence: true
  validates :game_review_id, uniqueness: true
end
