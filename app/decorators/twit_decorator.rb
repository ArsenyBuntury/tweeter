# frozen_string_literal: true

class TwitDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user
end
