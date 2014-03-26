include_attribute "deploy::default"


default[:opsworks][:rack_stack][:name] = "etl_app"
default[:opsworks][:rack_stack][:needs_reload] = true
default[:opsworks][:rack_stack][:service] = 'etl_app'
default[:opsworks][:rack_stack][:start_command] = "bin/etl -d -P run/etl.pid -l shared/log/etl.log"
default[:opsworks][:rack_stack][:bundle_command] = "/usr/local/bin/bundle" # "/usr/local/rvm/gems/ruby-1.9.3-p327@global/bin/bundle"

