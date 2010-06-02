class NamesController < ApplicationController
  def index
	@names = Name.find(:all)

	respond_to do |format|
		format.html
	end
  end

  def show
  end

  def create
	@name = Name.new(params[:name])

	respond_to do |format|
	if @name.save
		flash[:notice] = 'Name was sucessfully created.'
		format.html { redirect_to(@name) }
	else
		format.html { render :action => "new" }
	end
	end
  end

  def edit
  end

end
