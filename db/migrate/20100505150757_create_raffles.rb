class CreateRaffles < ActiveRecord::Migration
  def self.up
    create_table :raffles do |t|
      t.string :name
      t.string :studentid
      t.timestamps
    end
  end

  def self.down
    drop_table :raffles
  end
end
