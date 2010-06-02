class Validation < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :login_id
      t.string :last_name
      t.string :first_name
    end
  end

  def self.down
    drop_table :students
  end
end
