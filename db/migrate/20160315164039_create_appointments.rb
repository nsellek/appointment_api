class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :first_name
      t.string :last_name
      t.time :start_time
      t.time :end_time

      t.timestamps null: false
    end
  end
end
