class UsersController < ApplicationController

    def index
        return redirect_to root_path
    end 

    def new
        @user = User.new
    end

    def create 
        @user = User.create user_params

        if @user.save 
            return redirect_to root_path
        end

        render :new
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end
