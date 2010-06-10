class BillboardController < ApplicationController
  def index
    prev = params[:id].to_i
    quotes = Quote.find(:all)
    @quote = quotes.rand
    while  prev == @quote.id
      @quote = quotes.rand 
    end
    @student = Student.find(:first, :conditions => {:student_id =>  @quote.student_id})
  end
end
