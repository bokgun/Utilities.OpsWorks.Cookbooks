# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

bash "install_grunt" do
	code <<-EOH
	sudo npm install -g gulp
	EOH
	action :run
end
