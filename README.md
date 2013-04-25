SmartOS chef repo
=================

This repository is a base for starting with Chef on SmartOS. In
order to use this, please fork and do the following:

## Setup

1. Update knife.rb with your credentials. Note that you *do not*
   want to push your credentials into a public repo.
2. `bundle install`
3. `berks install`
4. `berks upload cookbooks`
5. `rake roles`
6. Create a user data bag for yourself based on
   data_bags/users/user.json
7. `knife data bag create users`
8. `knife data bag from file users your_user.json`

## Creating a server

```bash
knife joyent server create \
  --image cf7e2f40-9276-11e2-af9a-0bad2233fb0b \
  --flavor 'Small 1GB' \
  -N node.name \
  -d smartos \
  -E production \
  -r 'role[base]'
```

## Listing servers

```bash
knife joyent server list
```

## Deleting servers

```bash
knife joyent server delete <server_id>
```

Where server_id is the UUID of the smartmachine. In order to obtain
the server_id, use `knife joyent server list` or run `zonename` on
the machine. 

## Other server types

### PostgreSQL

```bash
knife data bag create rsyslog
knife data bag from file rsyslog data_bags/rsyslog

knife role from file postgres-server.rb
```

The `postgres-server` role configures PostgreSQL to log via syslog,
which we configure using rsyslog (with the included data bags). 
It installs an SMF named after the version installed.

* 9.2.4 => postgres924

Binaries and libraries are installed in `/opt/local/postgres-VERSION`

```bash
knife joyent server create \
  --image cf7e2f40-9276-11e2-af9a-0bad2233fb0b \
  --flavor 'Small 1GB' \
  -N node.name \
  -d smartos \
  -E production \
  -r 'role[base],role[postgres-server]'
```

In order to set up access control, configure 'connections' and
'replication' in the environment file. This info goes in pg_hba.conf
to allow clients to connect by IP or subnet.

The `postgres-client` role will install client libraries. By default
they will be installed via package.

## License

Copyright 2013 Eric Saxby

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

