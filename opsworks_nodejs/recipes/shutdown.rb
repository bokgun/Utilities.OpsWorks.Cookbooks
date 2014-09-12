execute "Upload logs before shutdown" do
  command "./etc/upload.sh"
  action :run
end