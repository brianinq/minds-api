class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :counselor_profile_id
      t.datetime :time
      t.string :topic
      t.string :title
      t.text :description
      t.string :location
      t.boolean :approved, default: false
      t.timestamps
    end
  end
end
