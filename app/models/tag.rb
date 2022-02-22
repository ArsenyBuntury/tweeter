# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :twit_tags, dependent: :destroy
  has_many :twits, through: :twit_tags

  validates :title, presence: true, uniqueness: true
end
