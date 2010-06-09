class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.column "student_id", :string
      t.column "first_name", :string
      t.column "last_name", :string
      t.column "login_id", :string
      t.timestamps
    end
    require 'csv'
    CSV.open('logindataSrJr.csv', 'r').each do |row|
      Student.create(:student_id => row[0], :last_name => row[1], :first_name => row[2], 
:login_id => row[3])
    end
  end

  def self.down
    drop_table :students
  end
end
