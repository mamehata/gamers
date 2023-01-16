class RoomChat < ApplicationRecord
  belongs_to :group_room
  belongs_to :group_member
end
