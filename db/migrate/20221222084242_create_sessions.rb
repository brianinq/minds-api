class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.integer :counselor_profile_id
      t.datetime :time
      t.string :topic
      t.string :title
      t.text :description
      t.integer :maximum, default: 10
      t.string :location

      t.timestamps
    end
  end
end
