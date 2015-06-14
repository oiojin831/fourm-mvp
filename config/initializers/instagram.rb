 require 'instagram'

Instagram.configure do |config|
  config.client_id = '9d430c15986b4ac7875d24f9cf461118'
  config.client_secret = 'ffad94a34b044cabae32fb2adb3e323c'
end

CALLBACK_URL = "http://52.68.126.138:8000/session/callback"
