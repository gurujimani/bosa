class CustomerSearchController < ApplicationController
  def index
  end

  def new
  end

  def create
    if params[:search][:id] == "1"
      flash[:error] = 'Customer ID: 1 is reserverd. Please enter a valid ID.'
      render :action => 'index'      
    else
      begin
        @customer = Customer.find(params[:search][:id])
      
        respond_to do |format|
              
          format.html { redirect_to customer_path(@customer) }        
        end
      rescue
        respond_to do |format|
          flash[:error] = "No customer found.  Please try again with a valid ID."
          format.html { render :action => "index" }
        end
      end
    end
        
  end
end
