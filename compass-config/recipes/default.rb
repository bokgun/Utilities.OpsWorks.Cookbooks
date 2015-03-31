# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

bash "install_grunt" do
	code <<-EOH
	cd /srv/www/compass/current/
	npm install
	grunt browserify
	EOH
	action :run
end
