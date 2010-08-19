class ContactsController < ApplicationController
 before_filter :find_customer
  
 # def index
 #   @contacts = @customer.contact.all
    
 #   flash[:notice] = "No address found for this customer" unless @contacts.empty?
 # end
 
 # def show
    
 # end
  
  def new    
    @contact = @customer.contacts.new        
  end
  
  def create
    @contact = @customer.contacts.new(params[:contact])
    
    respond_to do |format|
      if @contact.save
        flash[:notice] = "New address created successfully."
        format.html {redirect_to customer_path(@customer)}
      else
        flash[:error] = "Unable to create the address. Please refer to the error messages."
        format.html { render :action => 'new' }
      end
    end           
  end
  
  def edit
    @contact = @customer.contacts.find(params[:id])    
  end
  
  def update
    @contact = @customer.contacts.find(params[:id])
    
    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        flash[:notice] = "Address successfully updated."
        format.html { redirect_to customer_path(@customer)}
      else
        flash[:error] = "Unable to save the address. Please check the error message(s) below."
        format.html { render :action => 'edit' }
      end
    end
    
  end
  
  def destroy
    @contact = @customer.contacts.find(params[:id])
    
    respond_to do |format|
      if @contact.destroy
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
