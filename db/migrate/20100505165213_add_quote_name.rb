class AddQuoteName < ActiveRecord::Migration
  def self.up
	add_column "quotes", "name", :string
  end

  def self.down
	remove_column "quotes", "name"
  end
end
