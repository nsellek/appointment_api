class AddDayToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :day, :integer
  end
end
