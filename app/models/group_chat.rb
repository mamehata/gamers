class GroupChat < ApplicationRecord
  belongs_to :group
  belongs_to :member

  validates :group_chat, :member_id, :group_id, presence: true
end
