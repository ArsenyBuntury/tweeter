# frozen_string_literal: true

class Comment < ApplicationRecord
  include Commentable
  include Authorship
  belongs_to :twit
  belongs_to :user
  has_many :Subcomments
end
