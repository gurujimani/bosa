# 
#  purposes_controller.rb
#  bosa_test
#  
#  Created by N.Subramanian on 2011-08-21.
#  Copyright 2011 N.Subramanian. All rights reserved.
# 

class PurposesController < ApplicationController
  respond_to :html
  
  def index
    @purposes  = Purpose.all
    if @purposes.empty?
      flash[:error] = "No purpose details found in the system."
    end
    
  end
  
  def new
    @purpose = Purpose.new
  end
  
  def create
    @purpose = Purpose.new(params[:purpose])
    
    if @purpose.save
      flash[:notice] = 'New purpose successfully created.'
      redirect_to(purposes_path)
    else
      flash[:error] = 'Error creating the record. Please retry again'
      render :action => 'new'
    end    
  end
  
  def show
    @purpose = Purpose.find(params[:id])
  end
  
  def edit
    @purpose = Purpose.find(params[:id])
    
    respond_with(@purpose)
  end
  
  def update
    @purpose = Purpose.find(params[:id])
    
    if @purpose.update_attributes(params[:purpose])
      redirect_to purposes_path, :notice => 'Purpose updated successfully.'
    else
      flash[:error] = 'Unable to update the record. Please try again'
      render :action => 'edit'
    end    
  end
  
  def destroy
    @purpose = Purpose.find(params[:id])
    
    if @purpose.destroy
      flash[:notice] = "The purpose record successfully deleted."
    else
      flash[:error] = "Unable to delete the record. Please retry again."
    end
    redirect_to purposes_path
  end
end
