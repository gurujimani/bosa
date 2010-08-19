# 
#  currencies_controller.rb
#  bosa
#  
#  Created by N.Subramanian on 2010-08-19.
#  Copyright 2010 N.Subramanian. All rights reserved.
# 

class CurrenciesController < ApplicationController
  respond_to :html
  
  def index
     @currencies = Currency.all
     
     flash[:error] = "No currency record is found in the system..." if @currencies.empty?
     
     respond_with(@currencies)
  end
  
  def new
    @currency = Currency.new
  end
  
  def create
    @currency = Currency.new(params[:currency])
    
    flash[:notice] = "New currency successfully created..." if @currency.save
    respond_with(@currency)
  end
  
  def show
    @currency = Currency.find(params[:id]) 
    
    respond_with(@currency)    
  end
  
  def edit
    @currency = Currency.find(params[:id])
    
    respond_with(@currency)
  end
  
  def update
    @currency = Currency.find(params[:id])
    
    flash[:notice] = "Currency details successfully updated..." if @currency.update_attributes(params[:currency])
    
    respond_with(@currency)
    
  end
  
  def destroy
    @currency = Currency.find(params[:id])
    
    flash[:notice] = "Currency record successfully deleted..." if @currency.destroy
    
    respond_with(@currency)
  end
  
  def currentrate
    @currency = Currency.find(params[:id])
    
    @curr_ex_rate = @currency.current
    
    render :text => @curr_ex_rate
  end
end
