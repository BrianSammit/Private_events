class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Object successfully created"
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:error] = "Something went wrong"
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
    end
    
    private 

    def user_params
        params.require(:user).permit(:username, :email)
    end
    
    
end
