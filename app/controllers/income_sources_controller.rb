class IncomeSourcesController < ApplicationController
  respond_to :html
  
  def index
    @sources = IncomeSource.all
    
    if @sources.empty?
      flash[:error] = 'No income source is defined in the system.'
    end
  
  end
  
  def new
    @source = IncomeSource.new    
  end
  
  def create
    #raise params.inspect
    @source = IncomeSource.new(params[:income_source])
    
    if @source.save
      flash[:notice] = 'New income source successfully saved.'
      redirect_to income_sources_path
    else
      flash[:error] = 'Unable to save the income source record. Please try again.'
      render :action => 'new'
    end
    
  end
  
  def show
    
  end

  def edit
    @source = IncomeSource.find(params[:id])
  end
  
  def update
    @source = IncomeSource.find(params[:id])
    
    if @source.update_attributes(params[:income_source])
      #flash[:notice] = 'Income source updated successfully'
      redirect_to income_sources_path, :notice => 'Income source updated successfully'
    else
      flash[:error] = 'Unablet o save income source record. Please try again'
      render :action => 'edit'
    end
  end
  
  def destroy
    @source = IncomeSource.find(params[:id])
    
    if @source.destroy
      flash[:notice] = 'Income source successfully deleted.'       
    else
      flash[:error] = 'Unable to delete income source record.  Please try again'
    end
    redirect_to income_sources_path
  end
end
