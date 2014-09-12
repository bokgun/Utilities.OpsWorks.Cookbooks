execute "Upload logs before shutdown" do
  command "/bin/bash /etc/upload.sh"
  action :run
end