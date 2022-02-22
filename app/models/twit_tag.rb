# frozen_string_literal: true

class TwitTag < ApplicationRecord
  belongs_to :twit
  belongs_to :tag
end
