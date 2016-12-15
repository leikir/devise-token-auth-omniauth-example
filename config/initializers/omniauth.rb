Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
           {
             redirect_uri: "#{ENV['HOSTNAME']}/users/auth/google_oauth2/callback",
             image_aspect_ratio: "square",
             image_size: 180
           }
end
