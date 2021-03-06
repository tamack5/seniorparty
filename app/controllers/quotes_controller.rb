class QuotesController < ApplicationController

  # Before filter and the little private thing in the bottom are for authentication.

  before_filter :authentication, :except => [:create, :new]

  # GET /quotes
  # GET /quotes.xml
  def index
    @quotes = Quote.all
    @students = Student.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quotes }
    end
  end

  # GET /quotes/new
  # GET /quotes/new.xml
  def new
    @quote = Quote.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  # EDIT /quotes/1/edit
  def edit
    @quote = Quote.find(params[:id])
  end

  # POST /quotes
  # POST /quotes.xml
  def create
    @quote = Quote.new(params[:quote])
    if @quote.student_id.empty? || @quote.login_id.empty?
      respond_to do |format|
        flash[:notice] = 'Student ID and computer login number are required.'
        format.html { render :action => "new"  }
      end
    else
      if @student = Student.find(:first, :conditions => {:student_id =>  @quote.student_id})
        if @student.login_id == @quote.login_id
          respond_to do |format|
            if @quote.save
              #flash[:notice] = 'Quote was successfully created.'
              #flash[:notice] = @student
              format.html { redirect_to('/') }
              format.xml  { render :xml => @quote, :status => :created, :location => @quote }
            else
              format.html { render :action => "new" }
              format.xml  { render :xml => @quote, :status => :unprocessable_entity }
          end
        end
    else
      respond_to do |format|
        flash[:notice] = 'Student ID and computer login number are not correct.'
        format.html { render :action => "new"}
      end
    end
    else
      respond_to do |format|
        flash[:notice] = 'Student ID and computer login number are not correct.'
        format.html {render :action => "new"}
      end
    end
end
end

  # PUT /quotes/1
  # PUT /quotes/1.xml
  def update
    @quote = Quote.find(params[:id])

    respond_to do |format|
      if @quote.update_attributes(params[:quote])
        #flash[:notice] = 'Quote was successfully updated.'
        format.html { redirect_to :action=>'index' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.xml
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to(quotes_url) }
      format.xml  { head :ok }
    end
  end

  private

  def authentication
    id = "admin"
    pass = "admin"
    authenticate_or_request_with_http_basic do |user,password|
      user == id && password == pass
    end
  end
end
