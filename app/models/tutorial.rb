# frozen_string_literal: true

class Tutorial < ApplicationRecord
  has_many :videos, -> { order(position: :ASC) }, dependent: :destroy
  validates_presence_of :title, :description
  validates :thumbnail, format: { with: /.(gif|jpg|png)\Z/ }
  acts_as_taggable_on :tags, :tag_list
  accepts_nested_attributes_for :videos

  def self.no_class
    where(classroom: false)
  end

  def self.tag_paginate(tag_params, page_params)
    tagged_with(tag_params).paginate(page: page_params, per_page: 5)
  end
end
