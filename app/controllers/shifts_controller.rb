class ShiftsController < ApplicationController
    @hours_worked = 0

    def index
        @shifts = Shift.where(users_id: current_employees).order(start: :desc)
    end

    def create
        #combine start date and time into a single value
        params[:shift][:start] = params[:shift][:shift_date] + " " + params[:shift][:start_time]
        params[:shift][:finish] = params[:shift][:shift_date] + " " + params[:shift][:finish]

        params[:shift][:users_id] = current_user.id

        @shift = Shift.new(shift_params)

        if params[:shift][:shift_date] != "" && params[:shift][:start_time] != ""      
            @shift.save
        end

        redirect_to shifts_path
    end

    def edit
        @shift = Shift.find(params[:id])
    end

    def update
        #combine start date and time into a single value
        params[:shift][:start] = params[:shift][:shift_date] + " " + params[:shift][:start_time]
        params[:shift][:finish] = params[:shift][:shift_date] + " " + params[:shift][:finish]

        @shift = Shift.find(params[:id])

        if @shift.update(shift_params)
            redirect_to shifts_path
        else
            render 'edit'
        end
    end

    def destroy
        @shift = Shift.find(params[:id])
        @shift.destroy

        redirect_to shifts_path
    end

    def destroy_all
        Shift.where(users_id: current_user.id).destroy_all

        redirect_to organizations_path
    end

    private
        def shift_params
            params.require(:shift).permit(:start, :finish, :break_length, :users_id)
        end
end
