class Twit < ApplicationRecord
include Commentable
  has_many :comments, dependent: :destroy
  belongs_to :user

  has_many :twit_tags, dependent: :destroy
  has_many :tags, through: :twit_tags

  validates :name, presence: true
  validates :body, presence: true, length: { minimum: 2 }

  scope :all_by_tags, -> (tag_ids) do
    twits = includes(:user, :twit_tags, :tags)
    twits = twits.joins(:tags).where(tags: tag_ids) if tag_ids
    twits.order(created_at: :desc)
  end

end
