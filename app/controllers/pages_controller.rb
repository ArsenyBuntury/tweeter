class PagesController < ApplicationController
  def about
    @aboutus = t('about.aboutus')
  end

  def contacts; end

  def new; end
end
