node[:deploy].each do |application, _|
	bash "install freetds" do
		code <<-EOH
			sudo apt-get install -y unixodbc unixodbc-dev freetds-dev tdsodbc
		EOH
		action :run
	end
end