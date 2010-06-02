class RaffleController < ApplicationController
	def index
	quotes = Quote.find(:all)
        random = rand(quotes.length)
        @quote = Quote.find(quotes[random])
		respond_to do |format|
			format.html #indesx.html.erb
		end
	end

end
