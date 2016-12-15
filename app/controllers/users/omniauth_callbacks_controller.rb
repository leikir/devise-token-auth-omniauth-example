module Users
  class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
    include Devise::Controllers::Rememberable

    def omniauth_success
      super do |resource|
        if request.env['omniauth.params'].nil? # if backend standalone auth
          remember_me resource
          sign_in_and_redirect resource and return
        end
      end
    end

    protected

    def get_resource_from_auth_hash
      # We don't need that since we trust the email of unique provider google
      # @resource = resource_class.where({
      #                                    uid:      auth_hash['uid'],
      #                                    provider: auth_hash['provider']
      #                                  }).first

      @resource = resource_class.where(email: auth_hash['info']['email']).first

      # TODO : handle properly fail
      if @resource.nil?
        redirect_to root_path, alert: "Unkown email!" and return
      end

      # sync user info with provider, update/generate auth token
      # assign_provider_attrs(@resource, auth_hash)

      # @resource.uid = auth_hash['uid']
      # @resource.provider = auth_hash['provider']
      @resource.save

      # assign any additional (whitelisted) attributes
      # extra_params = whitelisted_params
      # @resource.assign_attributes(extra_params) if extra_params

      @resource
    end

  end
end
