class ChangeTimeForAppointment < ActiveRecord::Migration
  def change
  	change_column :appointments, :start_time,  :string
  	change_column :appointments, :end_time,  :string
  end
end
