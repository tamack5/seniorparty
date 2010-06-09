class QuoteLoginId < ActiveRecord::Migration
  def self.up
    add_column "quotes", "login_id", :string
  end

  def self.down
    add_column "quotes", "login_id"
  end
end
