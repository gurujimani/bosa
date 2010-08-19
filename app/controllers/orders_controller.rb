class OrdersController < ApplicationController
  respond_to :html
  
  def index
  end

  def new
    @order = Order.new
    @order.date = Time.now.to_date
    @order.time = Time.now.to_time
    @order.agent_id = Agent.find(1).id
        
    respond_with(@order)
  end

  def create
    @order = Order.new(params[:order])
    
    if @order.save
      flash[:notice] = "New order created successfully" 
    end
    
    respond_with(@order)
    
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
