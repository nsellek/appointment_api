class AppointmentsController < ApplicationController


  def index
    # Checks to see if there are any search params and if there are then filters the results
    appointments = Appointment.where(nil)
    appointments = appointments.start_time(params[:start_time]) if params[:start_time].present?
    appointments = appointments.end_time(params[:end_time]) if params[:end_time].present?

    render json: appointments, status: 200
  end

  def create
     appointment = Appointment.new(entered_params)

     # Checks to see if all inputs are valid
     if appointment.validationCheck && appointment.save
      render json: appointment, status: 201, location: appointment
     else
      render json: appointment.errors, status: 422
     end
  end

  def update
    appointment = Appointment.find(params[:id])
    appointment.assign_attributes(entered_params)
    if appointment.validateUpdate && appointment.save
      render json: appointment, status: 200, locaiton: appointment
    else
      render json: appointment.errors, status: 422
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])

    # Checks to make sure user input was found
    unless appointment.nil?
      appointment.delete
      head 204
    else
      head 404
    end
  end

  private


  def entered_params
    params.require(:appointment).permit(:first_name, :last_name, :start_time, :end_time, :day, :month, :year)
  end
end
