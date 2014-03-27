node[:deploy].each do |application, _|
	bash "update apt-get" do
		code <<-EOH
			sudo apt-get update
		EOH
		action :run
	end

	bash "install freetds" do
		code <<-EOH
			sudo apt-get install -y freetds-dev
		EOH
		action :run
	end

	bash "install tinytds" do
		code <<-EOH
			sudo gem install tiny_tds
		EOH
		action :run
	end

	bash "install sqlite3" do
		code <<-EOH
			sudo apt-get install libsqlite3-dev
		EOH
		action :run
	end
end