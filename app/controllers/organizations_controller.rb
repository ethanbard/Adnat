class OrganizationsController < ApplicationController
    def index
        #@organizations = Organization.all
    end

    def show
        #@organization = Organization.find(params[:id])
    end

    def new
        #@organization = Organization.new
    end

    def create_organization
        @organization = Organization.new(org_params)

        if @organization.save
            redirect_to :action => 'list'
        else
            render :action => 'new'
        end
    end

    def org_params
        params.require(:organizations).permit(:name, :hourly_rate)
    end

    def edit_organization
    end

    def update_organization
    end

    def delete_organization
    end
end
