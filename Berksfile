#!/usr/bin/env ruby
#^syntax detection

site :opscode

cookbook 'rbac'
cookbook 'resource-control'
cookbook 'smf'
cookbook 'sudo'
cookbook 'users', path: '~/workspace/chef/users'

cookbook 'chef-client', git: 'git@github.com:wanelo-chef/chef-client.git'
cookbook 'smartos', git: 'https://github.com/modcloth-cookbooks/smartos.git'
cookbook 'openssh', git: 'git@github.com:wanelo-chef/openssh.git'
cookbook 'hostname', git: 'git://github.com/modcloth-cookbooks/hostname.git'

cookbook 'git', git: 'git@github.com:wanelo-chef/git.git'
cookbook 'postgres', git: 'https://github.com/wanelo-chef/postgres.git'
cookbook 'java', git: 'https://github.com/wanelo-chef/java.git'
cookbook 'solr', git: 'https://github.com/wanelo-chef/solr.git'
cookbook 'sidekiq', git: 'git@github.com:wanelo-chef/sidekiq.git'
cookbook 'haproxy', git: 'git@github.com:wanelo-chef/haproxy.git'

cookbook 'redisio', git: 'git@github.com:wanelo-chef/redisio.git',
         ref: 'smartos'

# cookbook 'nodejs', git: 'https://github.com/mdxp/nodejs-cookbook.git'
