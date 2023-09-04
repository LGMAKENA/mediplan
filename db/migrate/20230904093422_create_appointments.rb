class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :date_time
      t.string :description
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
