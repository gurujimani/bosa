class OrdersController < ApplicationController
  respond_to :html, :js
  
  #load_and_authorize_resource
    
  def index
    @orders = Order.all
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
        
    respond_with(@order)
  end
  
  def create
    #raise params[:order].inspect
    @order = Order.new(params[:order])
    
    
   # respond_to do |format|
      
      if params[:commit] == "Process Order"
        if params[:contact_id].nil?
          @order.errors[:base] << "No valid address is selected."
        else
          @receiver_address = Address.find(params[:contact_id])
          
          @order.receiver_name = @receiver_address.receiver_name 
          @order.street = @receiver_address.street
          @order.city = @receiver_address.city
          @order.postcode = @receiver_address.postcode
          @order.district = @receiver_address.district
          @order.state = @receiver_address.state
          @order.country = @receiver_address.country
          @order.telephone = @receiver_address.telephone
          @order.mobile_phone = @receiver_address.mobile_phone
          @order.email = @receiver_address.email
      
          @receiver_address = nil
        end # End of if
        
        # format.html
        # format.js
        respond_with(@order)
           
      end # End of if
      if params[:commit] == "Create Order"
        
        flash[:notice] = "You clicked create button"
        render :action => 'new'
      end # End of if
    #end # End of do
    
    # @order = Order.new(params[:order])
    # 
    # respond_to do |format|
    #   
    #   if @order.save
    #     flash[:notice] = "New order created successfully"
    #     format.html {redirect_to(@order)}
    #   else
    #     flash[:error] = "Unable to create the order. Please check the error messages."
    #     format.html { render :action => 'new' }
    #   end
    #end
    
  end # End of def

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def check
    lkdsf
  end
  
  def walkin    
    @order = Order.new
    @order.customer_id = Customer.find(1).id
    @order.date = Time.now.to_date
    @order.time = Time.now.to_time
    @order.agent_id = Agent.find(1).id
        
    respond_with(@order)
  end
  
  def walkincreate
    @order = Order.create(params[:order])
    
    @order.customer_id = Customer.first.id
    
    if @order.valid?
      
    else
       render :action => 'walkin'
    end
  end
end
