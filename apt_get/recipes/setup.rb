node[:deploy].each do |application, _|
	bash "update apt-get" do
		code <<-EOH
			sudo apt-get update
		EOH
		action :run
	end
end