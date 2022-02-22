# frozen_string_literal: true

class PagesController < ApplicationController
  def about
    @aboutus = 'Всем привет! Я начинающий руби разработчик. Вы находитесь на моем клоне твиттера.'
  end

  def contacts; end

  def new; end
end
