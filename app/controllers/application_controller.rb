class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :user_signed_in?
    helper_method :name_user

    def current_user
        User.find_by(id: session[:user_id])
    end

    def user_signed_in?
        !current_user.nil?
    end

    def name_user (valor)
        @user = User.find(valor)
        return @user = @user.name
    end

    def authetificate_user!
        redirect_to login_path unless user_signed_in?
    end
end