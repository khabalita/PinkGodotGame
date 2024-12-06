extends Control

@export var player: Node

@onready var lifeEmpty : TextureRect = $Empty
@onready var lifeFull : TextureRect = $Full

var max_lifeUI : float = 3.0
var lifeUI: float = 3.0

func _ready() -> void:
	EventController.connect("on_life_changed", on_event_life_changed)
	EventController.connect("on_max_life_changed", on_event_max_life_changed)
	update_life_bar()
	update_max_life_bar()

func on_event_life_changed(node : Node, new_life: float):
	if node is player:
		lifeUI = clamp(new_life, 0, max_lifeUI)
		update_life_bar()

func on_event_max_life_changed(node : Node, new_max_life: float):
	if node is player:
		max_lifeUI = max(new_max_life, 1)
		update_max_life_bar()

func update_life_bar():
	if lifeFull:
		lifeFull.size = Vector2(lifeUI * 32, 32)

func update_max_life_bar():
	if lifeEmpty:
		lifeEmpty.size = Vector2(max_lifeUI * 32, 32)
