class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :current_organization
    helper_method :add_user_to_organization
    helper_method :remove_user_from_organization
    helper_method :user_name
    helper_method :current_employees
    helper_method :hours_worked
    helper_method :shift_cost
    
    def current_user
        User.find(session[:current_user_id])
    end

    def current_organization
        user = current_user
        Organization.find(current_user[:organizations_id])
    end

    def add_user_to_organization(params)
        user = current_user
        user.update(organizations_id: params[:id])
    end

    def remove_user_from_organization
        user = current_user
        user.update(organizations_id: nil)
    end

    def user_name(id)
        User.find(id)
    end

    def current_employees
        User.where(organizations_id: current_organization.id).pluck(:id)
    end

    def hours_worked(start, finish, break_length)
        hours = ((finish - start) / 3600) - (break_length / 60)
        hours.round(2)
    end

    def shift_cost(hours_worked)
        cost = hours_worked * current_organization.hourly_rate
        currency_format = "$%0.2f" % [cost]
    end
end
