require 'digest'

class Api::V1::UsersController < ApplicationController

    # GET /users
    def index
        @users = User.all
        render json: @users
    end

    # GET user/:username
    def show
        @user = User.find_by_username(params[:id])
        render json: @user
    end

    def create
        @user = User.new({:username => user_params[:username],:password => encrypt_password(user_params[:password])})
        @user.save
        render json: @user
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

    def encrypt_password(in_string)
        Digest::SHA256.hexdigest(in_string)
    end
end
