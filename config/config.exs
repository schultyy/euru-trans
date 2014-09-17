# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, EuruTrans.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_euru_trans_key",
  session_secret: "@_W1M01N5%*PPSL6CFVO8WEPLB1V_L6$$$&4UB5N&L4HU9F2IP&097QYZEBB1=HN)CBT(94S1VOFO9",
  catch_errors: true,
  debug_errors: false,
  error_controller: EuruTrans.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
