class AddValidatesToDatabase < ActiveRecord::Migration[5.2]
  def self.up
    change_table :todotasks do |t|
      t.change :name, :string, null: false
      t.change :content, :text, null: false
    end
  end
  def self.down
    change_table :todotasks do |t|
      t.change :name, :string
      t.change :content, :text
    end
  end
end
