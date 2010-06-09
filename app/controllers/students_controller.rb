class StudentsController < ApplicationController
  
  before_filter :authentication 
  def index
    @students = Student.all
    
    respond_to do |format|
      format.html
    end
  end

  def authentication
    id = "admin"
    pass = "admin"
    authenticate_or_request_with_http_basic do |user,password|
      user == id && password == pass
    end
  end

end
