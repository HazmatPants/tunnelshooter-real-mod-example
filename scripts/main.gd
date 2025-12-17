extends BaseMod

var sound

func on_load():
    sound = load_ogg(mod_path, "assets/sounds/test.ogg")
    print("Test Mod loaded!")
    GLOBAL.playsound(sound)

func on_ready():
    print("Test Mod ready!")

#func _unhandled_input(event: InputEvent) -> void:
#    if event is InputEventKey:
#        if event.keycode == KEY_H and event.pressed:
#            GLOBAL.playsound(sound)
