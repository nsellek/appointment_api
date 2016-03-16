class Appointment < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :day, presence: true
	validates :month, presence: true
	validates :year, presence: true

	def validationCheck
		@valid = true
		valid_year
		valid_month
		valid_day
		valid_time
		return false unless @valid = true
		valid_time_slot
		@valid
	end

	def valid_year
		# This checks to see if the year is from now(this is dynamic so its not just a fixed year) onward
		@valid = false unless self.year.to_i >= Time.new.year
		# This checks if the year is the current one and if it is saves it
		@current_year = true if self.year.to_i == Time.new.year
	end

	def valid_month
		@number_of_month = 0
		months = Date::MONTHNAMES
		# Normalizes the input
		cap_month = self.month.downcase.capitalize

		months.each_with_index do |name, index|
			# Ignores the nil in the months array
			if name
				# Checks for matching full name
				@number_of_month = index if cap_month == name
				# Checks for matching abr
				@number_of_month = index if cap_month == name[0..2]
				@number_of_month = index if cap_month.to_i == index
			end
		end

		@valid = false if @number_of_month == 0
		if @valid && @current_year
			# Checks to see if the month is the current one or one in the furture
			@valid = false unless @number_of_month >= Time.new.month
			# Checks to see if month is current
			@current_month = true if @number_of_month == Time.new.month
		end
	end

	def valid_day
		@valid = false unless self.day.to_i <= Time.days_in_month(@number_of_month) && self.day.to_i > 0
		# Checks to see if the day is today or the future
		if @valid && @current_month
			@valid = false unless self.day.to_i >= Time.new.day
			# Checks to see if the day is today
			@current_day = true if self.day.to_i == Time.new.day
		end
	end

	def valid_time
		start_time = self.start_time.downcase
		end_time = self.end_time.downcase
		now = Time.now

		# Checks to see if start and end time can be converted to time class
		@valid = false unless Time.parse(start_time)
		@valid = false unless Time.parse(end_time)
		
		# Checks to see if the start time is the current itme or a time in the future
		@valid = false unless Time.parse(start_time, now) >= Time.now
	end

	def valid_time_slot
		appointments = Appointment.all
		# Saves the times of the appointment being saved
		appointment_start_time = Time.parse(self.start_time).to_i
		appointment_end_time = Time.parse(self.start_time).to_i
	end
end
