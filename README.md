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

```json
{
    "id": "test-mod", # the mod's internal identifier
    "name": "Test Mod", # the mod's display name
    "author": "HazmatPants", # the mod's author (who created it)
    "description": "A test/example mod", # a description of what the mod does
    "priority": 0, # the mod's load order
    "main": "scripts/main.gd", # the mod's entry point script
}
```

## Loading resources
To load a resource from your mod, you can't use `preload()` or `load()` since Godot cannot preload or load resources from the `user://` folder.
Instead, you must create the resource manually and load it from the file, `BaseMod` contains some helper functions for this. `preload()` and `load()` can only be used if the resource exists in the game's assets.

Example loading an audio file from the game:
```gdscript
extends BaseMod

var sfx_ogg := preload("res://assets/audio/sfx/weapons/caliber/50_shoot.wav")

func on_ready(): # when mod is added to tree
    GLOBAL.playsound(sfx_ogg) # play the loaded sound
```

Example loading audio files:
```gdscript
extends BaseMod

var sfx_ogg: AudioStream
var sfx_wav: AudioStream
var sfx_mp3: AudioStream

func on_load(): # when mod is loaded
    sfx_ogg = load_ogg(mod_path, "assets/audio/sound.ogg")
    sfx_wav = load_wav(mod_path, "assets/audio/sound.wav")
    sfx_mp3 = load_mp3(mod_path, "assets/audio/sound.mp3")

func on_ready(): # when mod is added to tree
    GLOBAL.playsound(sfx_ogg) # play the loaded sound
```

Example loading an image file:
```gdscript
extends BaseMod

var image: Image

func on_load(): # when mod is loaded
    image = load_image(mod_path, "assets/textures/image.png")
```

It's also possible to load other scripts, like so:
```gdscript
# scripts/main.gd
extends BaseMod

var helper_script: Node

func on_load():
    helper = load_script(mod_path, "scripts/helper.gd")

    helper.helper()
```

```gdscript
# scripts/helper.gd
extends Node

func helper():
    print("Helper script works!")
```

Read the [BaseMod](https://github.com/HazmatPants/tunnelshooter-real/blob/main/modding/mod.gd) class from tunnelshooter-real to see what these functions actually do, they're very simple, and you can of course add your own resource loading functions to your mod.
