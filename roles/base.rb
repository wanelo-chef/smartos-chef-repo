name "base"
description "Base role for smartos base64 hosts."

default_attributes(
  "authorization" => {
    "sudo" => {
      "groups" => %w(sysadmins),
      "users" => [],
      "passwordless" => true
    }
  },
  "openssh" => {
    "server" => {
      "protocol" => "2",
      "password_authentication" => "no",
      "lookup_client_hostnames" => "no",
      "verify_reverse_mapping" => "no",
      "x11_forwarding" => "yes",
      "x11_display_offset" => "10",
      "x11_use_localhost" => "yes",
      "print_motd" => "no",
      "keep_alive" => "yes",
      "syslog_facility" => "auth",
      "host_key" => %w(/var/ssh/ssh_host_rsa_key /var/ssh/ssh_host_dsa_key),
      "login_grace_time" => 20,
      "permit_root_login" => "no",
      "permit_user_environment" => "yes",
      "subsystem" => "sftp  internal-sftp",
      "listen_address" => "::"
    }
  }
)

run_list(%w(
    recipe[smartos::default]
    recipe[smf]
    recipe[chef-client::default]
    recipe[chef-client::delete_validation]
    recipe[smartos::link_awk]
    recipe[smartos::link_grep]
    recipe[smartos::link_whoami]
    recipe[smartos::link_tar]
    recipe[users::sysadmins]
    recipe[sudo::default]
    recipe[smartos::link_sudo]
    recipe[hostname::default]
    recipe[openssh]
))


