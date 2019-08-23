require 'digest'

class Api::V1::UsersController < ApplicationController

    before_action :authorize_request, except: :create
    before_action :find_user, except: %i[create index]
    # GET /api/v1/users
    def index
        @users = User.all
        render json: @users, status: :ok
    end

    # GET apuser/{username}
    def show
        # @user = User.find_by_username(params[:username])
        render json: @user, status: :ok
    end

    # POST /users
    def create
        #@user = User.new({:username => user_params[:username],:password => encrypt_password(user_params[:password]), :email => user_params[:email]})
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render  json: {errors: @user.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    # PUT /users/{username}
    def update
        unless @user.update(user_params)
            render  json: { errors: @user.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    # DELETE /users/{username}
    def destroy
        @user.destroy
    end

    private

    def find_user
        @user = User.find_by_username(params[:username])
        rescue Active::Record::RecordNotFound
            render json: {errors: 'User Not Found'}, status: not_found
    end

    def user_params
        params.permit(:username, :password, :email)
    end

    def encrypt_password(in_string)
        Digest::SHA256.hexdigest(in_string)
    end
end
