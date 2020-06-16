class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "User successfully created"
          redirect_to @user
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:username)
    end
    
end
