class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :display_button_new
    helper_method :display_button_log
    helper_method :display_username
    helper_method :user_validation


    def current_user
      User.find_by(id: session[:user_id])
    end

    def display_username
      return current_user.username if current_user
    end
  
    def display_button_log
      if current_user.present?
        return display_username
      else
        "<a class='button is-success' href='/login'>Sign in</a>".html_safe
      end
    end

    def user_validation
      if current_user.present?
        return "<a class='button is-danger' href='/logout'>Log out</a>".html_safe
      else
        "<a class='button is-success' href='/sign_up'>Sign up</a>".html_safe
      end
    end
  
    def display_button_new
      return "<a class='button is-success' href='/events/new'>NEW EVENT</a>".html_safe if current_user.present?
    end
end
