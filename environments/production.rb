name 'production'
description 'Production environment'

default_attributes(
  'postgres' => {
    'connections' => {
      # Only trust IPs on your internal subnet
      '127.0.0.1/0' => 'trust',
      '10.0.0.0/8' => 'trust',
    },
    'replication' => {
      '10.0.0.0/8' => 'trust',
    }
  }
)
