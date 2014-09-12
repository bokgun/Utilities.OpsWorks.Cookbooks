template "/etc/upload.sh" do
  source "upload.sh.erb"
  mode 0700
  owner "root"
  group "root"
  action :create
end

cron "Log uploader" do
  minute "0"
  command "./etc/upload.sh"
end