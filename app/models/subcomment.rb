# frozen_string_literal: true

class Subcomment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :comment, optional: true
  validates :body, presence: true, length: { minimum: 2 }
end
