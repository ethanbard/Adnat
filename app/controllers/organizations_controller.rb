class OrganizationsController < ApplicationController
    def index
        @organizations = Organization.all
    end

    def create
        @organization = Organization.new(organization_params)

        @organization.save
        redirect_to @organization
    end

    def new
    end

    def edit
    end

    def show
        @organization = Organization.find(params[:id])
    end

    def update
    end

    def destroy
    end

    private
        def organization_params
            params.require(:organization).permit(:name, :hourly_rate)
        end
end
