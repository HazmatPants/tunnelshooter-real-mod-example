# TunnelShooter: Real Example Mod

This repo contains an example mod for [tunnelshooter-real](https://github.com/HazmatPants/tunnelshooter-real)

Mods use [GDScript](https://gdscript.com/) for scripting, the language used in Godot Engine, and the language TunnelShooter: Real was written in.

# WARNING
Mods are able to:
- Run arbitrary code
- Access your files (`FileAcess`, `DirAccess`, `OS`)
- Make HTTP requests (`HTTPClient`)
- Crash the game

If you download a mod, please review its code first.

[main.gd](scripts/main.gd) contains a lot of info for available functions and variables.

If you have any suggestions for what to add to the modding system, like a new auto-load or class, create an issue and let me now :D

## Manifest
The mod's manifest defines some info about it, like the name, or who made it.

```
{
    "id": "test-mod", # the mod's internal identifier
    "name": "Test Mod", # the mod's display name
    "author": "HazmatPants", # the mod's author (who created it)
    "description": "A test/example mod", # a description of what the mod does
    "priority": 0, # the mod's load order
    "main": "scripts/main.gd", # the mod's entry point script
}
```
