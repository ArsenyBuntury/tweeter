# frozen_string_literal: true

module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :subcomments, as: :commentable, dependent: :destroy
  end
end
