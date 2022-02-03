class Twit < ApplicationRecord
	has_many :comments
	validates :name, presence: true
	validates :body, presence: true, length: {minimum: 2}
end
