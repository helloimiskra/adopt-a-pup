Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],  {
        scope: 'userinfo.email, userinfo.profile, plus.me',
        include_granted_scopes: true,
        callback_path: '/auth/google_oauth2/callback'
      }
  end

