class SessionsController < ApplicationController
    def new; end
    
    def create
        user = User
                .find_by(email: params["email"])
        if user
            session[:user_id] = user.id
            redirect_to root_path
        else
            render json: { status: 401 }
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'Logged out!'
    end
end
