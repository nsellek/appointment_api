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

		number_of_month = 0
		months = Date::MONTHNAMES
		self.month.downcase.capitalize

		months.each_with_index do |name, index|
			# Ignores the nil in the months array
			if name
				number_of_month = index if self.month == name
				number_of_month = index if self.month == name[0..2]
				number_of_month = index if self.month.to_i == index
			end
		end

		@valid = false if number_of_month == 0

		if @valid == true && @current_year == true
			# Checks to see if the month is the current one or one in the furture
			@valid = false unless number_of_month >= Time.new.month
			# Checks to see if month is current
			@current_month = true if number_of_month == Time.new.month
		end
	end
end
