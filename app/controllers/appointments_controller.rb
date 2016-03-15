class AppointmentsController < ApplicationController

	def index
		appointments = Appointment.all

		render json: appointments, status: 200
	end

	def create
		 appointment = Appointment.new(entered_ params)

		 if 
	end

	def update

	end

	def destroy
		appointment = Appointment.find(params[:id])

		unless appointment.nil?
			appointment.delete
			head 204
		else
			head 404
		end
	end

	private

	def entered_params
		params.require(:appointment).permit(:first_name, :last_name, :start_time, :end_time)
	end
end
