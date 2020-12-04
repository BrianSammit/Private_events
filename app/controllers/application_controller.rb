class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :display_button_new
    helper_method :display_button_log


    def current_user
      User.find_by(id: session[:user_id])
    end
  
    def display_button_log(current_user)
      if current_user.present?
        return "<div class='field is-grouped mt-2 mr-2'>
            <p class='control'>
              <a class='button is-info'>Profile</a>
            </p>
            <p class='control'>
              <a class='button is-danger' rel='nofollow' data-method='delete' href='/sessions/new'>Log out</a>
            </p>
          </div>".html_safe
      end
  
      "<div class='field is-grouped mt-2 mr-2'>
          <p class='control'>
            <a class='button is-success' href='/sessions/new'>Sign in</a>
          </p>
          <p class='control'>
            <a class='button is-success' href='/users/new'>Sign up</a>
          </p>
        </div>".html_safe
    end
  
    def display_button_new(current_user)
      return "<a class='button is-success' href='/posts/new'>New Post</a>".html_safe if current_user.present?
    end
end
