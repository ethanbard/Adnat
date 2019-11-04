class UsersController < ApplicationController
    def index
        if cookies[:current_user_id] != nil
            user = user_name(cookies[:current_user_id])
            session[:current_user_id] = user.id

            if user.organizations_id != nil
                redirect_to organization_path(user.organizations_id)
            else
                redirect_to organizations_path
            end
        else
            @user = User.new
        end
    end

    def login
        @user = User.find_by(email_address: params[:user][:email_address])
 
        if @user == nil
            @user = User.new
            @user.errors.add(:base, "Invalid Email")
            render 'index'
        else
            if params[:user][:password] != @user.password
                @user.errors.add(:base, "Invalid Password")
                render 'index'
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

    def logout
        #delete the current user cookie
        cookies.delete(:current_user_id)
        session[:current_user_id] = nil
        redirect_to users_path
    end

    def password
        @user = User.new
    end

    def reset_password
        @user = User.find_by(email_address: params[:user][:email_address])

        if @user == nil
            @user = User.new
            @user.errors.add(:base, "Invalid Email")
            render 'password'
        else
            if @user.update(user_params)
                add_user_to_session
                if @user.organizations_id != nil
                    redirect_to organization_path(@user.organizations_id)
                else
                    redirect_to organizations_path
                end
            else
                render 'password'
            end
        end
    end

    def create
        @user = User.new(user_params)

        if @user.save
            add_user_to_session
            redirect_to organizations_path
        else
            render 'new'
        end
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to organizations_path
        else
            render 'edit'
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email_address, :password, :password_confirmation)
        end

        def add_user_to_session
            session[:current_user_id] = @user.id #Add user to session
            if params[:user][:remember_me] == "1" #if Remember me is selected
                cookies.permanent[:current_user_id] = @user.id
            end
        end
end
