class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.string :email
      t.integer :age
      t.string :gender
      t.string :avatar
      t.boolean :is_cancellor, default: false
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
