class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :cancellor_profile_id
      t.datetime :time
      t.string :topic
      t.string :title
      t.text :description
      t.integer :maximum
      t.string :location
      t.boolean :approved, default: true
      t.timestamps
    end
  end
end
