class AddressesController < ApplicationController
  before_filter :find_customer
  
 # def index
 #   @addresses = @customer.address.all
    
 #   flash[:notice] = "No address found for this customer" unless @addresses.empty?
 # end
 
 # def show
    
 # end
  
  def new    
    @address = @customer.addresses.new        
  end
  
  def create
    @address = @customer.addresses.new(params[:address])
    
    respond_to do |format|
      if @address.save
        flash[:notice] = "New address created successfully."
        format.html {redirect_to customer_path(@customer)}
      else
        flash[:error] = "Unable to create the address. Please refer to the error messages."
        format.html { render :action => 'new' }
      end
    end           
  end
  
  def edit
    @address = @customer.addresses.find(params[:id])    
  end
  
  def update
    @address = @customer.addresses.find(params[:id])
    
    respond_to do |format|
      if @address.update_attributes(params[:address])
        flash[:notice] = "Address successfully updated."
        format.html { redirect_to customer_path(@customer)}
      else
        flash[:error] = "Unable to save the address. Please check the error message(s) below."
        format.html { render :action => 'edit' }
      end
    end
    
  end
  
  def destroy
    @address = @customer.addresses.find(params[:id])
    
    respond_to do |format|
      if @address.destroy
        flash[:notice] = "Address successfully deleted."
        format.html {redirect_to customer_path(@customer)}
      else
        flash[:error] = "Unable to delete the address"
        format.html {redirect_to customer_path(@customer)}
      end
    end
    
  end
  
  private
  
  def find_customer
    @customer = Customer.find(params[:customer_id])
  end
end
