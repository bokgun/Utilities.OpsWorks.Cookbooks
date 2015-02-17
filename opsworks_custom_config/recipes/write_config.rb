node[:deploy].each do |application, deploy|
  custom_config_template do
    application application
    deploy deploy
    custom_config node[:custom_config]
  end
end
