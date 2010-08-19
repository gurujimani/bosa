class AgentsController < ApplicationController
  def index
    @agents = Agent.all
    
    flash[:error] = "No agent record found in the system." if @agents.empty?
  end

  def show
    @agent = Agent.find(params[:id])
  end

  def new
    @agent = Agent.new
  end

  def create
    @agent = Agent.new(params[:agent])
    
    respond_to do |format|
      if @agent.save
        flash[:notice] = "New agent record successfully created."
        format.html { redirect_to(@agent) }
      else
        flash[:error] = "Unable to create agent record. Please refer the the error messages below."
        format.html { render :action => 'new' }
      end
    end
  end

  def edit
    @agent = Agent.find(params[:id])
  end

  def update
    @agent = Agent.find(params[:id])
    
    respond_to do |format|
      if @agent.update_attributes(params[:agent])
        flash[:notice] = "Agent record successfully updated."
        format.html { redirect_to( @agent ) }
      else
        flash[:error] = "Unable to update agent record. Please refer to the error messages below."
        format.html { render :action => 'edit' }
      end
    end
  end

  def destroy
    @agent = Agent.find(params[:id])
    
    respond_to do |format|
      if @agent.destroy
        flash[:notice] = "Agent record successfully deleted."
        format.html { redirect_to (agents_path)}
      else
        flash[:error] = "Unable delete agent record. Please refer to the error messages below."
        format.html { redirect_to(agents_path) }    
      end
    end
  end

end
