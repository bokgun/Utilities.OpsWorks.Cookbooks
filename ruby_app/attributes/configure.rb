include_attribute "deploy::default"


default[:opsworks][:rack_stack][:name] = "etl_app"
default[:opsworks][:rack_stack][:needs_reload] = true
default[:opsworks][:rack_stack][:service] = 'etl_app'
default[:opsworks][:rack_stack][:start_command] = "/srv/www/etl_app/bin/etl -d -P /srv/www/etl_app/run/etl.pid -l /srv/www/etl_app/shared/log/etl.log"
default[:opsworks][:rack_stack][:bundle_command] = "/usr/local/bin/bundle" # "/usr/local/rvm/gems/ruby-1.9.3-p327@global/bin/bundle"

