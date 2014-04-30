node[:deploy].each do |application, _|
	bash "install tinytds" do
		code <<-EOH
			sudo apt-get install unixodbc unixodbc-dev freetds-dev tdsodbc
		EOH
		action :run
	end
end