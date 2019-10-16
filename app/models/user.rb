# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos

  validates_presence_of :email, :first_name, :last_name, :password_digest
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_many :friendships
  has_many :friends, through: :friendships

  #has_many :followers, foreign_key: :followed_user_id, class_name: 'Following'
  #has_many :follower_users, through: :followers, source: :user
  
  enum role: %i[default admin]
  has_secure_password
end
