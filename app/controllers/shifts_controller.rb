class ShiftsController < ApplicationController
    def index
        @shifts = Shift.all
    end

    def create
        @shift = Shift.new(params[:shift])

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
