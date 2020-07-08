class User < ApplicationRecord
  has_many :user_videos, dependent: :destroy
  has_many :videos, through: :user_videos
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  validates :first_name, presence: true

  enum role: { default: 0, admin: 1}
  has_secure_password
end
