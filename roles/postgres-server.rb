name "postgres-server"
description "PostgreSQL Database Server"

default_attributes(
  'postgres' => {
    'version' => '9.2.4',
    'listen_interfaces' => ["net1", "lo0"],
    'config' => {
      'log_destination'                 => 'syslog',
      'max_connections'                 => 1500,
      'wal_keep_segments'               => 2000,
      'autovacuum_analyze_scale_factor' => '0.1',
      'autovacuum_vacuum_scale_factor'  => '0.2',
      'work_mem_mb'                     => 128,
      'maintenance_work_mem_mb'         => 512,
      'log_min_duration_statement_ms'   => 80,
      'wal_buffers'                     => '32MB',
      'wal_writer_delay'                => '200ms',
      'synchronous_commit'              => 'off',
      'commit_delay'                    => 100,
      'commit_siblings'                 => 5,
      'autovacuum_freeze_max_age'       => '1000000000',
      'vacuum_freeze_min_age'           => '5000000'
    }
  }
)

run_list(%w[
    recipe[rsyslog::server]
    recipe[postgres::server]
])



