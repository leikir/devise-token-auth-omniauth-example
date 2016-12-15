Rails.application.routes.draw do

  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  mount_devise_token_auth_for 'User', at: 'api/v1/auth', controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root 'application#home'
end
