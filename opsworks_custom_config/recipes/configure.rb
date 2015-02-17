node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping opsworks_custom_config::write_config #{application} as it is not a rails app")
    next
  end

  include_recipe "opsworks_custom_config::write_config"
end
