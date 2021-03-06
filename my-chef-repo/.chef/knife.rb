# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "srajan"
client_key               "#{current_dir}/srajan.pem"
validation_client_name   "strain-validator"
validation_key           "#{current_dir}/strain-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/strain"
cookbook_path            ["#{current_dir}/../cookbooks"]
