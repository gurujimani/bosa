# 
#  customers_controller.rb
#  bosa
#  
#  Created by N.Subramanian on 2010-08-19.
#  Copyright 2010 N.Subramanian. All rights reserved.
# 

class CustomersController < ApplicationController
  #current_section("customers")
  
  #load_and_authorize_resource
    
  def index
    @customers = Customer.all
      if @customers.empty?
        flash[:error] = "No customer record found in the system."
      end
  end
  
  def show
    @customer = Customer.find(params[:id])
    @contacts = @customer.contacts.all
    flash[:error] = "No address found for this customer" if @contacts.empty?      
  end
    
  def new
    @customer = Customer.new    
    @customer.dob = Time.now.to_date
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
        #format.html { redirect_to(customers_path)}
      else
        flash[:error] = "Unable to delete the record."
        #format.html { redirect_to(customers_path) }
      end
      format.html { redirect_to(customers_path)}
    end
  end
  
  def getcontacts
    if !params[:id].empty?
      @customer = Customer.find(params[:id])
      @contacts = @customer.contacts.all
        
      respond_to do |format|
          format.js { render :partial => 'contacts' } unless @contacts.empty?
      end
    else
      render :text => 'Please select a customer from the list'
    end
  end
  
end
