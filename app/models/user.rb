# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos

  validates_presence_of :email, :first_name, :last_name, :password_digest
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  enum role: %i[default admin]
  has_secure_password
end
