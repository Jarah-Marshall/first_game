extends CanvasLayer

@export_file("*.tscn") var main_menu_scene: String = "res://main_menu.tscn"

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = false

	%Resume.pressed.connect(resume)
	%Settings.pressed.connect(%SettingsMenu.open)
	%SettingsMenu.closed.connect(%Settings.grab_focus)
	%MainMenu.pressed.connect(_go_to_main_menu)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			resume()
		else:
			pause()
		get_viewport().set_input_as_handled()

func pause() -> void:
	get_tree().paused = true
	visible = true
	%Resume.grab_focus()

func resume() -> void:
	get_tree().paused = false
	visible = false

func _go_to_main_menu() -> void:
	get_tree().paused = false  
	get_tree().change_scene_to_file(main_menu_scene)
