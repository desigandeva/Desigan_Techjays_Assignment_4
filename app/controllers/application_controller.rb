class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
            format.html { redirect_to root_path,alert: exception.message }
        end
    end
    
    def index
    end

    def current_ability
        @current_ability ||= Ability.new(current_auth)
    end 
end
