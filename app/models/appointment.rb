class Appointment < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :day, presence: true
	validates :month, presence: true
	validates :year, presence: true

	

end
