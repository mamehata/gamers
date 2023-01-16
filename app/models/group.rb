class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :members, through: :group_members
  has_many :group_chats, dependent: :destroy
  has_many :chat_members, through: :group_chats, class_name: 'Member'
  has_many :group_rooms, dependent: :destroy
  belongs_to :game_review

  validates  :group_owner_id, :group_name, :group_introduction, :game_review_id, presence: true
  validates  :game_review_id, uniqueness: true
end
