class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end
  
  def edit
    super    
  end
  
  def update
    #raise params[:user].inspect
    super
  end

end
