class PagesController < ApplicationController
  def about
    @aboutus = t('about.aboutus')
  end

  def contacts
  end

  def new
  end

  def home
    if sign_in?
      @micropost = current_user.micropost.build
    end
  end
end
