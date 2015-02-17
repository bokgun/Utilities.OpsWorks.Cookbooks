# Accepts:
#   application (application name)
#   deploy (hash of deploy attributes)
#   env (hash of custom environment settings)
#

define :custom_config_template do
  Chef::Log.debug("Applying custom config entries for #{params[:application]}")

  if params[:custom_config] && params[:application] && params[:custom_config][params[:application]]
    params[:custom_config][params[:application]].each do |file_name, config|
      template "#{params[:deploy][:deploy_to]}/shared/config/#{file_name}.yml" do
        source "sample.yml.erb"
        owner params[:deploy][:user]
        group params[:deploy][:group]
        mode "0660"
        variables :env => config, :rails_env => params[:deploy][:rails_env]

        only_if do
          File.exists?("#{params[:deploy][:deploy_to]}/shared/config")
        end
      end
    end
  end
end
