class AddColumnPriorityToTodotasks < ActiveRecord::Migration[5.2]
  def change
    add_column :todotasks, :prioirty, :integer
  end
end
