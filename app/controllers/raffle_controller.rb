class RaffleController < ApplicationController
	def index
	quotes = Quote.find(:all)
        random = rand(quotes.length)
        @quote = Quote.find(quotes[random])
        @student = Student.find(:first, :conditions => {:student_id =>  @quote.student_id})
		respond_to do |format|
			format.html #indesx.html.erb
		end
	end

end
