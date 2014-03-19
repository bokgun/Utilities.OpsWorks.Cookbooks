node[:deploy].each do |application, deploy|
  if node[:deploy][application][:application_type] != 'ruby_app'
    Chef::Log.debug("Skipping ruby_app::configure for application #{application} as it is not set as a plain ruby app")
    next
  end
  
  group node[:deploy][application][:group]

  user node[:deploy][application][:user] do
    action    :create
    comment   "deploy user"
    uid       next_free_uid
    gid       node[:deploy][application][:group]
    home      node[:deploy][application][:home]
    supports  :manage_home => true
    shell     node[:deploy][application][:shell]
    
    not_if do
      existing_usernames = []
      Etc.passwd {|user| existing_usernames << user['name']}
      existing_usernames.include?(node[:deploy][application][:user])
    end
  end
  
  ['log','config','system','pids','scripts','sockets'].each do |dir_name|
    directory "#{node[:deploy][application][:deploy_to]}/shared/#{dir_name}" do
      group       node[:deploy][application][:group]
      owner       node[:deploy][application][:user]
      mode        0770
      action      :create
      recursive   true
    end
  end

end
