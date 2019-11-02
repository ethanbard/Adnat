class UsersController < ApplicationController
    def index
        session[:current_user] = nil
        @users = User.all
    end

    def login
        login = params[:user]
        @user = User.find_by(email_address: login[:email_address])
 
        if @user == nil
            render html: "Invalid Email"
        else
            if login[:password] != @user.password
                render html: "Invalid Password"
            else
                add_user_to_session
                if @user.organizations_id != nil
                    redirect_to organization_path(@user.organizations_id)
                else
                    redirect_to organizations_path
                end
            end
        end
    end

    def create
        new_user = params[:user]

        if new_user[:password] != new_user[:password_confirmation]
            render html: "Passwords do not match"
        else
            @user = User.new(user_params)

            if @user.save
                add_user_to_session
                redirect_to organizations_path
            else
                render 'new'
            end
        end
    end

    def new
        @user = User.new
    end

    def edit
        render html: "Reset password here"
    end

    def show
    end

    def update
    end

    def destroy
    end

    private
        def user_params
            params.require(:user).permit(:name, :email_address, :password)
        end

        def add_user_to_session
            session[:current_user_id] = @user.id #Add user to session
        end
end
