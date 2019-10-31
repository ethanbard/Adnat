class UsersController < ApplicationController
    def index
    end

    def create
        #@user = User.new(params[:user])

        #@user.save
        #redirect_to @user
        redirect_to organizations_path
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
