use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, EuruTrans.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  cookies: true,
  session_key: "_euru_trans_key",
  session_secret: "@_W1M01N5%*PPSL6CFVO8WEPLB1V_L6$$$&4UB5N&L4HU9F2IP&097QYZEBB1=HN)CBT(94S1VOFO9"

config :logger, :console,
  level: :info,
  metadata: [:request_id]

