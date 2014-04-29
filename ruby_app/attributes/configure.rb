include_attribute "deploy::default"

node[:deploy].each do |application, _|
default[:opsworks][:rack_stack][:name] = "#{application}"
default[:opsworks][:rack_stack][:needs_reload] = true
default[:opsworks][:rack_stack][:service] = "#{application}"
default[:opsworks][:rack_stack][:start_command] = "sudo bin/#{application} -d --pid run/#{application}.pid -l shared/log/#{application}.log"
default[:opsworks][:rack_stack][:stop_command] = "sudo bin/#{application} -k -P run/#{application}.pid"
default[:opsworks][:rack_stack][:bundle_command] = "/usr/local/bin/bundle" # "/usr/local/rvm/gems/ruby-1.9.3-p327@global/bin/bundle"
default[:opsworks][:rack_stack][:pid] = "run/#{application}.pid"

end

