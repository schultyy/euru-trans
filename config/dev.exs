use Mix.Config

config :phoenix, EuruTrans.Router,
  port: System.get_env("PORT") || 4000,
  ssl: false,
  host: "localhost",
  cookies: true,
  session_key: "_euru_trans_key",
  session_secret: "@_W1M01N5%*PPSL6CFVO8WEPLB1V_L6$$$&4UB5N&L4HU9F2IP&097QYZEBB1=HN)CBT(94S1VOFO9",
  debug_errors: true

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


