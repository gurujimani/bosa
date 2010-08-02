class CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
    if @customers.empty?
      flash[:notice] = "No customer record available"
    end
  end
  
  def show
    @customer = Customer.find(params[:id])
    
    if @customer
      @addresses = @customer.addresses.all
      flash[:notice] = "No address found for this customer" if @addresses.empty?
    end
  end
  
  def new
    @customer = Customer.new    
    @customer.dob = Time.now
  end
  
  def create
    @customer = Customer.new(params[:customer])
    
    respond_to do |format|
      if @customer.save
        flash[:notice] = "New customer record successfully created..."
        format.html { redirect_to(@customer)  }
      else
        flash.now[:error] = "Unable to create the record."
        format.html { render :action => 'new' }
      end
    end
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    
    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        flash[:notice] = "Customer details successfully updated..."
        format.html { redirect_to (@customer)  }
      else
        flash.now[:error] = "Unable to update the details. Please check the inline error messages."
        format.html { render :action => 'edit'}
      end
    end
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    respond_to do |format|
      if @customer.destroy
        flash[:notice] = "Customer record successfully deleted..."
        format.html { redirect_to(customers_path)}
      else
        flash[:notice] = "Unable to delete the record."
        format.html { redirect_to(customers_path) }
      end
    end
  end
  
end
