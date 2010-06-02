class Email < ActiveRecord::Migration
  def self.up
    add_column :quotes, :email, :string
  end

  def self.down
  end
end
