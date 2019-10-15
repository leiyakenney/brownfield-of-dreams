# frozen_string_literal: true

class Video < ApplicationRecord
  has_many :user_videos, dependent: :destroy
  has_many :users, through: :user_videos
  #user_videos here is why we have to add the cascade
  belongs_to :tutorial
  validates_presence_of :position

  def self.ordered_grouped_videos
    self.select("videos.tutorial_id, videos.title, videos.position")
    .order(:position)
    .group_by(&:tutorial_id)
  end
end
