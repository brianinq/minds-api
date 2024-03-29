class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :counselor_profile_id
      t.integer :user_id
      t.text :comment
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
