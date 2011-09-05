class ExratesController < ApplicationController
  respond_to :html
  
  def index
    @exrates = Exrate.all
    
    flash[:error] = "No exchange record details found in the system..." if @exrates.empty?
  end
  
  def show
    @exrate = Exrate.find(params[:id])    
  end

  def new
    @exrate = Exrate.new
    @exrate.ex_rate_date = Time.now  
  end

  def create
    @exrate = Exrate.new(params[:exrate])
    
    respond_to do |format|
      if @exrate.save
        flash[:notice] = "New exchange rate successfully created..."
        format.html {redirect_to exrates_path}
      else
        flash[:error] = "Unable to create a new exchange rate. Please refer to the error messages."
        format.html { render :action  => "new" }        
      end
    end
    #flash[:notice] = "New exchange rate successfully created..." if @exrate.save
    #respond_with(@exrate)
  end

  def edit 
    @exrate = Exrate.find(params[:id])
  end
  
  def update
    @exrate = Exrate.find(params[:id])
    
    flash[:notice] = "Exchange rate details successfully updated..." if @exrate.update_attributes(params[:exrate])
    redirect_to exrates_path
  end

  def destroy
    @ex_rate = Exrate.find(params[:id])
    
    flash[:notice] = "Exchange rate successfully deleted..." if @exrate.destroy
  end
end
