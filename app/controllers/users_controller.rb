class UsersController < ApplicationController
    def index
    end

    def create
        @user = Organization.new(params[:user])

        @user.save
        redirect_to @user
    end

    def new
    end

    def edit
    end

    def show
    end

    def update
    end

    def destroy
    end
end
