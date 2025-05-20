fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name 'bs-handbags'
author 'Blaze Scripts'
description 'Handbags as Item'
version '1.1.1'

lua54 'yes'

shared_scripts {
    '@rsg-core/shared/locale.lua',
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

dependency {
    'rsg-core',
    'ox_lib'
}