class AppointmentController < ApplicationController

	def index
		appointments = Appointment.all

		render json: appointments, status: 200
	end

	def create

	end

	def update

	end

	def destroy

	end

	private

	def valid_params
		params.require(:appointment).permit(:first_name, :last_name, :start_time, :end_time)
	end
end
