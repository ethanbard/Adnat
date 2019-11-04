class OrganizationsController < ApplicationController
    def index
        @organizations = Organization.all
        remove_user_from_organization
    end

    def new
    end

    def edit
        @organization = Organization.find(params[:id])
    end

    def create
        @organization = Organization.new(organization_params)

        if @organization.save
            redirect_to @organization
        else
            redirect_to organizations_path
        end
    end

    def show
        @organization = Organization.find(params[:id])
        add_user_to_organization(params)
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
