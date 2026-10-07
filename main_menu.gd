extends Control

@export_file("*.tscn") var game_scene: String = "res://survivors_game.tscn"

func _ready() -> void:
	get_tree().paused = false
	%StartGame.pressed.connect(_on_new_game_pressed)
	%Settings.pressed.connect(%SettingsMenu.open)
	%SettingsMenu.closed.connect(%Settings.grab_focus)
	%Quit.pressed.connect(get_tree().quit)
	%StartGame.grab_focus()

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file(game_scene)
