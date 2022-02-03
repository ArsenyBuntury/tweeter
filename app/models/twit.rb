class Twit < ApplicationRecord
	validates :name, presence: true
	validates :body, presence: true, length: {minimum: 15}
end
