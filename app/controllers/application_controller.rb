class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :display_button_new
    helper_method :display_button_log
    helper_method :display_username
    helper_method :user_validation


    def current_user
      User.find_by(id: session[:user_id])
    end

    def display_username(current_user)
      return current_user.username if current_user
    end
  
    def display_button_log
      if current_user.present?
        return display_username
      else
        '<%= link_to "Log in", login_path, class: "button is-light"%>'
      end
    end

    def user_validation
      if current_user.present?
        return '<%= link_to "Sign up", logout_path, class: "button is-light"%>'
      else
        '<%= link_to "Sign up", new_session_path, class: "button is-light"%>'
      end
    end
  
    def display_button_new
      return "<%= link_to 'New Event', new_event_path, class: 'button is-success' %>" if current_user.present?
    end
end
