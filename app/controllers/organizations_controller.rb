class OrganizationsController < ApplicationController
    def index
    end

    def create
        @organization = Organization.new(params[:organization])

        @organization.save
        redirect_to @organization
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
