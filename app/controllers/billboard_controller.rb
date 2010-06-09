class BillboardController < ApplicationController
  def index
    prev = params[:id].to_i
    quotes = Quote.find(:all)
    @quote = quotes.rand
    @student = Student.find(:first, :conditions => {:student_id =>  @quote.student_id})
    while  prev == @quote.id
      @quote = quotes.rand
    end
  end
end
