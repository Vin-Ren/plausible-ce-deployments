import Config

config :plausible, Plausible.IngestRepo,
    hostname: "plausible-clickhouse-db.internal",
    port: 8123,
    database: "events",
    transport_opts: [inet6: true]
