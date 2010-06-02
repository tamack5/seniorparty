class CreateBillboards < ActiveRecord::Migration
  def self.up
    create_table :billboards do |t|
      t.string :name
      t.string :studentid
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :billboards
  end
end
