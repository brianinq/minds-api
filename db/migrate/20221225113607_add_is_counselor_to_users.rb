class AddIsCounselorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_counselor, :boolean, default: false
  end
end
