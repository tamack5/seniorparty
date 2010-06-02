class BillboardController < ApplicationController
  def index
    prev = params[:id].to_i
    quotes = Quote.find(:all)
    @quote = quotes.rand
    while  prev == @quote.id
      @quote = quotes.rand
    end
  end
end
