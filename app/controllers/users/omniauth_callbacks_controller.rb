module Users
  class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
    include Devise::Controllers::Rememberable

    def omniauth_success
      super do |resource|
        if omniauth_window_type.present? # auth requested from angular
          sign_in resource
        else # auth requested from backend standalone
          remember_me resource
          sign_in_and_redirect resource and return
        end
      end
    end

    protected

    def get_resource_from_auth_hash
      @resource = resource_class.where(email: auth_hash['info']['email']).first

      # TODO : handle properly fail
      # JD : not working, need to do something smarter if this method return nil
      if @resource.nil?
        redirect_to root_path, alert: "Unkown email!" and return
      end

      @resource
    end

  end
end
