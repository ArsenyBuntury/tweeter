class ApplicationController < ActionController::Base
  include ErrorHandling
  include Authentification

  around_action :switch_locale

  private

    def switch_locale(&action)
      set_locale  || I18n.default_locale
      I18n.with_locale(@locale, &action)
    end

    def locale_from_url
      set_locale 
      return locale if I18n.available_locales.map(&:to_s).include?(locale)
      nil
    end

    def default_url_options
      { locale: I18n.locale }
    end

    private 
        
    def set_locale
      @locale = params[:locale] 
    end
 end

