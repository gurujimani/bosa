class CommissionsController < ApplicationController
  respond_to :html
  
  def index
    @commissions = Commission.all
    if @commissions.empty?
      flash[:error] = "No commission record found"''
    end 
  end

  def new
    @commission = Commission.new
  end

  def create
    @commission = Commission.new(params[:commission])
    
    respond_to do |format|
      if @commission.save
        flash[:notice] = "New commission details successfully created."
        format.html { redirect_to commissions_path }
      else
        flash[:error] = "Unable to create the record. Please check the error messages below."
        format.html { render :action => 'new' }
      end
    end
  end

  def show
    @commission = Commission.find(params[:id])
  end

  def edit
    @commission = Commission.find(params[:id])
  end

  def update
    @commission = Commission.find(params[:id])
    
    respond_to do |format| 
      if @commission.update_attributes(params[:commission])
        flash[:notice] = "Commission details successfully updated..."
        format.html { redirect_to commissions_path }
      else
        flash[:error] = "Unable to update commission details. Please refer to the error messages."
        format.html { render :action => 'edit' }
      end
    end
  end

  def destroy
    @commission = Commission.find(params[:id])
    
    respond_to do |format|
      if @commission.destroy
        flash[:notice] = "Commission details successfully deleted."
        format.html { redirect_to commissions_path }
      else
        flash[:error] = "Unableto delete the commission record..."
        format.html { redirect_to commissions_path }
      end
    end
  end
  
  def getcommission
    
    @amount = params[:amount].to_f
    @result = "test"
    @result_xml = "test"
    @commissions = Commission.all
    respond_to do |format|
      @commissions.each do |commission|
        if @amount >= commission.from_amount && @amount <= commission.to_amount
          @result = commission.to_json
          @result_xml = commission.to_xml
        end
      end
      format.html { render :text => 'this is the output for html' + commission.commission.to_s }
      format.js { render :text => @result }   
      format.xml { render :xml  => @result_xml } 
    end
  end

end
