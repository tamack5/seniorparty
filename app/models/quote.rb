class Quote < ActiveRecord::Base
  #validates_presence_of :name, :student_id, :content
  validates_presence_of :content, :message => "is empty"
  validates_format_of :content, :with => /.{1}/, :message => "is too long"
  #validates_format_of :content, :with => /\w+{1,15}/, :message => "contains a word that is too long"
  validates_format_of :name, :with => /^.+\s.+$/, :message => "must contain both first and last name"
  validates_numericality_of :student_id, :only_integer => true, :on => :create
  validates_length_of :student_id, :is => 6, :message => "ID is the wrong length (should be 6 characters)"
  validates_uniqueness_of :student_id, :scope => :student_id, :message => "ID has already been used"
  validates_format_of :email, :with => /^.+@.+\.(com|org|net|edu)$|^$/
end
