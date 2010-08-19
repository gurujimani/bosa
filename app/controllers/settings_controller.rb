class SettingsController < ApplicationController
    
    def index
      @setting = Setting.first
      
      flash[:error] = "No system settings found in the system.  Please create the settings" if @setting.nil?
    end
    
    def edit
      @setting = Setting.find(params[:id])
    end
    
    def update
      
    end
end
