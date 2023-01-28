class GroupChat < ApplicationRecord
  belongs_to :group
  belongs_to :member
  has_many :notifications, dependent: :destroy

  validates :group_chat, presence: true
end
