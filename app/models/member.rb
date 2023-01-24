class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :goods_reviews, dependent: :destroy
  has_many :game_reviews, dependent: :destroy
  has_many :goods_likes, dependent: :destroy
  has_many :like_goods_reviews, through: :goods_likes, source: :goods_review
  has_many :game_likes, dependent: :destroy
  has_many :like_game_reviews, through: :game_likes, source: :game_review
  has_many :goods_comments, dependent: :destroy
  has_many :game_comments, dependent: :destroy
  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members
  has_many :group_rooms, through: :group_members, source: :group_room
  has_many :owner_groups, class_name: 'Group', foreign_key: "group_owner_id"
  has_many :group_chats, dependent: :destroy
  has_many :follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :follows, source: :followed
  has_many :followers, through: :reverse_of_follows, source: :follower

  validates :member_name, presence: true

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.guest
    find_or_create_by!(member_name: 'ゲストメンバー' ,email: 'guest@example.com') do |member|
    member.password = SecureRandom.urlsafe_base64
    member.member_name = "ゲストメンバー"
    end
  end

  def follow(other_member)
    if self != other_member
    self.follows.find_or_create_by(followed_id: other_member)
    end
  end

  def unfollow(other_member)
    follow = self.follows.find_by(followed_id: other_member).destroy
    if !follow.nil?
      follow.destroy
    end
  end

  def following?(member)
    self.followings.exists?(id: member)
  end

  def self.search_member(search_word)
    self.where('member_name LIKE?', "%#{search_word}%")
  end
end
