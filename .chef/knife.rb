current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "user"
client_key               "#{ENV['HOME']}/.ssh/user.pem"
validation_client_name   "user-validator"
validation_key           "#{current_dir}/validator.pem"
chef_server_url          "https://api.opscode.com/organizations/user-organization"
cache_type               'BasicFile'
cache_options(:path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            "#{current_dir}/../cookbooks"

# required to extract the right interface for knife ssh
knife[:ssh_attribute] = "ipaddress"

knife[:joyent_username] = ENV['SDC_USERNAME'] || 'user'
knife[:joyent_keyname] = ENV['SDC_CLI_KEY_ID'] || 'keyname'
knife[:joyent_keyfile] = ENV['SDC_CLI_IDENTITY'] || "#{ENV['HOME']}/.ssh/id_rsa"
knife[:joyent_api_url] = 'https://us-sw-1.api.joyentcloud.com/'
