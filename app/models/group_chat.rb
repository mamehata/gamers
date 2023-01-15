class GroupChat < ApplicationRecord
  belongs_to :group
  belongs_to :member
  
  validates :group_chat, presence: true
end
