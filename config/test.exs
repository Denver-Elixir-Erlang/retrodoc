use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :retrodoc, Retrodoc.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :retrodoc, Retrodoc.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DATABASE_USERNAME"),
  password: System.get_env("DATABASE_PASSWORD"),
  database: "retrodoc_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
