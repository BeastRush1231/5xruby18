class AddStatuscolumnToTodotasks < ActiveRecord::Migration[5.2]
  def change
    add_column :todotasks, :status, :integer
  end
end
