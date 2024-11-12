extends Control

@export var player: Node

@onready var lifeEmpty : TextureRect = $Empty
@onready var lifeFull : TextureRect = $Full

var max_lifeUI : float = 0.0: set = _set_max_life, get = _get_max_life
var lifeUI: float = 0.0: set = _set_life, get = _get_life

func _ready() -> void:
	EventController.connect("on_life_changed", on_event_life_changed)
	EventController.connect("on_max_life_changed", on_event_max_life_changed)
	EventController.emit_signal("on_life_ui_ready", player)
	_set_max_life(3.0)
	_set_life(3.0)

func _set_life(value: float) -> void:
	lifeUI = clamp(value, 0, max_lifeUI)
	if lifeFull:
		lifeFull.set_size(Vector2(lifeUI * 32, 32))

func _get_life() -> float:
	return lifeUI

func _set_max_life(value: float) -> void:
	max_lifeUI = max(value, 1)
	if lifeEmpty:
		lifeEmpty.set_size(Vector2(max_lifeUI * 32, 32))

func _get_max_life() -> float:
	return max_lifeUI

func on_event_life_changed(node: Node, new_life: float):
	if node == player:
		_set_life(new_life)

func on_event_max_life_changed(node: Node, new_max_life: float):
	if node == player:
		_set_max_life(new_max_life)
