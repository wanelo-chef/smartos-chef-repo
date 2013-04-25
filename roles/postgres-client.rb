name "postgres-client"
description "PostgreSQL Database Client"

run_list(%w[
    recipe[postgres::client]
])
