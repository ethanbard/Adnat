class ShiftsController < ApplicationController
    def index
    end

    def create
        @shift = Organization.new(params[:shift])

        @shift.save
        redirect_to @shift
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
