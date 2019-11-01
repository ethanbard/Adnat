class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :add_user_to_organization
    
    def current_user
        User.find(session[:current_user_id])
    end

    def add_user_to_organization(params)
        user = current_user
        user.update(organizations_id: params[:id])
    end

    def remove_user_from_organization
        user = current_user
        user.update(organizations_id: nil)
    end
end
