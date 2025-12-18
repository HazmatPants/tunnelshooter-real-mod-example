# You can run ANY GDScript code.

# The game has a few auto-loads for easier interaction
# `GLOBAL`:
#    GLOBAL.playsound(stream, volume_linear, pitch_scale, bus)
#      stream: the AudioStream to play
#      volume_linear: the sound's linear volume
#          0.0 is silent, 1.0 is normal volume.
#          defaults to 1.0
#      pitch_scale: the sound's pitch multiplier.
#          defaults to 1.0
#      bus: the bus to play the sound on. defaults to the "SFX" bus
#    GLOBAL.playsound3d(stream, global_position, volume_linear, pitch_scale, bus)
#      same as GLOBAL.playsound, but in 3D.
#      specify `global_position` for where to play the sound in 3D space
#    GLOBAL.randsfx(sound_list)
#      returns a random AudioStream from an Array of AudioStreams
# `GunManager`:
#    register_gun(
#     gun_id: String,
#     gun_name: String,
#     caliber_id: String,
#     scene_path: String,
#     description: String="",
#     manufacturer: String="unknown",
#     )
#       registers a new gun for use in-game
#       gun_id: the gun's internal identifier
#       gun_name: the gun's display gun_name, shows in the inspect screen
#       caliber_id: the internal id of the round the gun uses
#       scene_path: a path to the gun's scene file (.tscn)
#       description: a description for the gun, shows in the inspect screen
#       manufacturer: the gun's manufacturer, just shows in the inspect screen

# BaseMod contains some helper functions and variables
# you are not required to use it

#   Functions:
#       load_wav(base_path: String, file_path: String) -> AudioStreamWAV
#           loads a WAV audio file and returns it
#       load_ogg(base_path: String, file_path: String) -> AudioStreamOggVorbis:
#           loads an OGG Vorbis audio file and returns it
#       load_image(base_path: String, file_path: String) -> Image:
#           loads an Image and returns it
#   Variables:
#       var mod_path: String
#           the path to the mod's folder
#       var mod_id: String
#           the mod's id
#       var mod_name: String
#           the mod's display name
#       var author: String
#           the mod's author
#       var description: String
#           the mod's description
#       var priority: int
#           the mod's load priority'
#       var main: String
#           the path to the mod's main script file

extends BaseMod # extend the BaseMod class

var sound: AudioStream # null AudioStream variable

func on_load(): # This runs when the mod is loaded
    sound = load_ogg(mod_path, "assets/sounds/test.ogg") # load a sound
    print("Test Mod loaded!")

func on_ready(): # This runs when the mod is added to the scene tree (`func _ready()`)
    print("Test Mod ready!")

func on_unload(): # This will run when the mod is unloaded (currently not implemented)
    print("Test Mod unloaded!")

# This function plays the sound when you press the H key
func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventKey:
        if event.keycode == KEY_H and event.pressed:
            GLOBAL.playsound(sound)
