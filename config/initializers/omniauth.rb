Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, '87bff065f91b482e89de8e4d4236b888', '58ce4086f3e44ca380c7425448a2a7fe'
end
