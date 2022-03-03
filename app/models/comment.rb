class Comment < ApplicationRecord
  include Commentable
  belongs_to :twit
  belongs_to :user
  has_many :Subcomments
  validates :commenter, presence: true
  validates :body, presence: true
end
