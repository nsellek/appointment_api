class AppointmentsController < ApplicationController

	def index
		appointments = Appointment.all

		render json: appointments, status: 200
	end

	def create
		 appointment = Appointment.new(entered_params)


		 # Checks to see if all inputs are valid
		 if appointment.validationCheck && appointment.save
		 	render json: appointment, status: 201
		 else
		 	render json: appointment.errors, status: 422
		 end
	end

	def update

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
