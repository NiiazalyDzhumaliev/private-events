class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find(params[:username])
        
        if user
            session[:current_user_id] = @user_id       
            flash[:success] = "Logged in"
            redirect_to root
        else
            flash[:error] = "username invalid"
            render "new"     
        end
    end

end
