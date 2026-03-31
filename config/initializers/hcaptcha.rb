Hcaptcha.configure do |config|
  config.site_key = ENV.fetch("HCAPTCHA_SITE_KEY", nil)
  config.secret_key = ENV.fetch("HCAPTCHA_SECRET_KEY", nil)
end
