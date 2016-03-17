class AddYearToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :year, :string
  end
end
