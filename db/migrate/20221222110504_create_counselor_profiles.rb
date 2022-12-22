class CreateCounselorProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :counselor_profiles do |t|
      t.string :specialization
      t.integer :user_id
      t.boolean :verified, default: false
      t.text :bio
      t.text :experience
      
      t.timestamps
    end
  end
end
