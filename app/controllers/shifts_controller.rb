class ShiftsController < ApplicationController
    @hours_worked = 0

    def index
        @shifts = Shift.where(users_id: current_employees)
    end

    def create
        #combine start date and time into a single value
        params[:shift][:start] = params[:shift][:shift_date] + " " + params[:shift][:start_time]
        params[:shift][:finish] = params[:shift][:shift_date] + " " + params[:shift][:finish]

        params[:shift][:users_id] = current_user.id

        @shift = Shift.new(shift_params)

        @shift.save
        redirect_to shifts_path
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
        Shift.where(users_id: params[:id]).destroy_all

        redirect_to organizations_path
    end

    private
        def shift_params
            params.require(:shift).permit(:start, :finish, :break_length, :users_id)
        end
end
