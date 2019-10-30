class OrganizationsController < ApplicationController
    def index
        @organizations = Organization.all
    end

    def new
    end

    def edit
        @organization = Organization.find(params[:id])
    end

    def create
        @organization = Organization.new(organization_params)

        @organization.save
        redirect_to @organization
    end

    def show
        @organization = Organization.find(params[:id])
    end

    def update
        @organization = Organization.find(params[:id])

        if @organization.update(organization_params)
            redirect_to @organization
        else
            render 'edit'
        end
    end

    def destroy
        @organization = Organization.find(params[:id])
        @organization.destroy

        redirect_to organizations_path
    end

    private
        def organization_params
            params.require(:organization).permit(:name, :hourly_rate)
        end
end
