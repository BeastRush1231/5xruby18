class AddColumnToTodotasks < ActiveRecord::Migration[5.2]
  def change
    add_column :todotasks, :start_time, :datetime
    add_column :todotasks, :end_time, :datetime
  end
end
