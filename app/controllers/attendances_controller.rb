class AttendancesController < ApplicationController
    include EventsHelper

    def new
        @attendance = Attendance.new()
    end

    def create
        @event = Event.find(event_params)
        @attendance = Attendance.new(event_id: @event.id, user_id: params[:user_id])

        if @attendance.save
          flash[:success] = "Invite successfully created"
          redirect_to event_path
        else
          flash[:error] = "Something went wrong"
        end
    end
    
    
    def update
        @attendance = Attendance.find(params[:id])
        if @attendance.update_attributes(params[:attendance])
          flash[:success] = "Object was successfully updated"
          redirect_to event_path
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
end
