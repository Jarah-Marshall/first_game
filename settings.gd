extends Control

signal closed

const DEFAULT_VOLUME := 50.0 

static var _default_applied := false

func _ready() -> void:
	visible = false

	if not _default_applied:
		_apply_volume(DEFAULT_VOLUME)
		_default_applied = true

	%VolumeSlider.value = db_to_linear(AudioServer.get_bus_volume_db(0)) * 100.0

	%VolumeSlider.value_changed.connect(_apply_volume)
	%Close.pressed.connect(close)

func _unhandled_input(event: InputEvent) -> void:
	if visible and event.is_action_pressed("pause"):
		close()
		get_viewport().set_input_as_handled()

func open() -> void:
	visible = true
	%VolumeSlider.grab_focus()

func close() -> void:
	visible = false
	closed.emit()

func _apply_volume(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(value / 100.0))
