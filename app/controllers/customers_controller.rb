class CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
    if @customers.empty?
      flash[:notice] = "No customer record available"
    end
  end
  
  def new
    @customer = Customer.new    
  end
  
  def create
    @customer = Customer.new(params[:customer])
    
    if @customer.save
      flash[:notice] = "New customer record successfully created..."
      redirect_to(customers_path)
    else
      render :action => 'new'
    end
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
end
