class Twit < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :body, presence: true, length: { minimum: 2 }
end
