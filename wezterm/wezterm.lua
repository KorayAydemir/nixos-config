local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

local domains = wezterm.default_wsl_domains()
for _, d in ipairs(domains) do
  d.default_cwd = '/home/nixos'
end
config.wsl_domains = domains
config.default_domain = 'WSL:NixOS'

config.window_padding = {
	top = 0,
	bottom = 0,
	left = 0,
	right = 0,
}

config.leader = { key = 'Space', mods = 'ALT', timeout_milliseconds = 1000 }
local SUPER = 'ALT'

config.keys = {
    { key = "c", mods = SUPER, action = act({ CopyTo = "Clipboard" }) },
    { key = "v", mods = SUPER, action = act({ PasteFrom = "Clipboard" }) },
    { key = 'f', mods = SUPER, action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 't', mods = SUPER, action = act.SpawnCommandInNewTab {
        domain = { DomainName = 'WSL:NixOS' },
        cwd = '/home/nixos',
    } },
    { key = 'w',  mods =SUPER,  action = act.CloseCurrentPane { confirm = true } },
    { key = 'n', mods = SUPER, action = act.ActivateTabRelative(1) },
    { key = 'p', mods = SUPER, action = act.ActivateTabRelative(-1) },
}


return config
