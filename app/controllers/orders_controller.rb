class OrdersController < ApplicationController
  respond_to :html, :js
  
  #load_and_authorize_resource
    
  def index
    @orders = Order.order('id')
    if @orders.empty?
      flash[:warning] = "No orders found in the system."
    end
    respond_with(@orders)  
  end

  def new
    @order = Order.new
    @order.date = Time.now.to_date
    @order.time = Time.now.to_time
    @order.agent_id = Agent.find(1).id

    @contact = Contact.find(params[:id])

    @order.customer_id = @contact.customer.id
    @order.receiver_name = @contact.contact_person
    @order.street = @contact.street
    @order.city = @contact.city
    @order.postcode = @contact.postcode
    @order.district = @contact.district
    @order.state = @contact.state
    @order.country = @contact.country
    @order.telephone = @contact.telephone
    @order.mobile_phone = @contact.mobile
    @order.email = @contact.email
            
    respond_with(@order)
  end
  
  def create
    #raise params[:order].inspect
    @order = Order.new(params[:order])
    
    @order.time = Time.now.to_time
    
    unless params[:order][:delivery_currency].empty?
      @currency  = Currency.find(params[:order][:delivery_currency])
      @order.delivery_currency = @currency.name
    end   
    
    respond_to do |format|
  
      if @order.save
        flash[:notice] = "New order created successfully"
        format.html {redirect_to orders_path}
      else
        flash[:error] = "Unable to create the order. Please check the error messages."
        format.html { render :action => 'new' }
      end
    end
  end # End of def

  def show
    @order = Order.find(params[:id])
    respond_with(@order)
  end

  def edit
    @order = Order.find(params[:id])
    respond_with(@order)
  end

  def update
    @order = Order.find(params[:id])
    
    respont_to do |format|
      if @order.update_attributes(params[:order])
        #flash[:notice] = 'Order updated successfully'
        format.html {redirect_to orders_path, :notice => 'Order updated successfully'}
      else
        flahs.now[:error] = 'Unable to delete the order.'
        format.html {render :action => 'edit'}
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    
    if @order.destroy
      flash[:notice] = 'Order deleted successfully'
    else
      flash[:error] = 'Unable to delete the order.  Please check again.'
    end
    redirect_to orders_path
  end

  def check
    lkdsf
  end
  
  def walkin    
    @order = Order.new
    @order.customer_id = Customer.find(1).id
    @order.date = Time.now.to_date

    @order.agent_id = Agent.find(1).id
        
    respond_with(@order)
  end
  
  def walkincreate
    @order = Order.new(params[:order])
    @order.time = Time.now.to_time    
    @order.customer_id = Customer.first.id
    unless params[:order][:delivery_currency].empty?
      @currency  = Currency.find(params[:order][:delivery_currency])
      @order.delivery_currency = @currency.name
    end
    
    if @order.save
      flash[:notice] = "Walk-in order successfully created..."
      redirect_to orders_path
    else
      flash[:error] = "Unable to create the order. Pls refer to the error messgaes below."
      render :action => 'walkin'      
    end
  end
end