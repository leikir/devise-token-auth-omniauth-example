class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  # N.B.:
  # This controller is inherited by Devise's controllers
  # In particular, Devise::OmniauthCallbacksController

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    ENV['HOSTNAME']
  end

  def home
    byebug
  end

end
