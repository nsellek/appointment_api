class AddMonthToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :month, :string
  end
end
