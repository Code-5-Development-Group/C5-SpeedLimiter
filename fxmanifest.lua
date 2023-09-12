fx_version "cerulean"

description "Code Five Development Group Speed Limiter Script"
author "Code Five Development Group"
version '1.0.0'

lua54 'yes'

games {
  "gta5",
  "rdr3"
}

ui_page 'web/build/index.html'

client_script 'config.lua'
client_script "client/**/*"

files {
  'web/build/index.html',
  'web/build/**/*'
}