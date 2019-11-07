class AddUserIdToTodotask < ActiveRecord::Migration[5.2]
  def change
    add_column :todotasks, :user_id, :integer
  end
end
