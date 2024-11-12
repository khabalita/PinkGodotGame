extends Control

@onready var collected = $Collected

func _ready() -> void:
	EventController.connect("moon_collected", on_event_moon_collected)

func on_event_moon_collected(value: int) -> void:
	collected.text = str(value)
