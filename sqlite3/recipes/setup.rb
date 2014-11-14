node[:deploy].each do |application, _|
	bash "install sqlite3" do
		code <<-EOH
			sudo apt-get install libsqlite3-dev
		EOH
		action :run
	end
end