local wezterm = require 'wezterm'
local path = [[\\wsl.localhost\NixOS\home\nixos\nixos-config\wezterm\wezterm.lua]]

wezterm.add_to_config_reload_watch_list(path)

local ok, result = pcall(dofile, path)
if ok then
  return result
end

wezterm.log_error('Failed to load WSL config: ' .. tostring(result))
return { default_domain = 'WSL:NixOS' }
