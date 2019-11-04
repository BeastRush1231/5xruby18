class CreateTodotasks < ActiveRecord::Migration[5.2]
  def change
    create_table :todotasks do |t|
      t.string "name"
      t.text "content"

      t.timestamps
    end
  end
end
