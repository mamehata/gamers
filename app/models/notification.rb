class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :member
  belongs_to :group_chat
  belongs_to :group
end
