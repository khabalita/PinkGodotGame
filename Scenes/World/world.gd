extends Node2D

@export var next_level : PackedScene
@onready var spawner = $Spawner

func _ready():
	EventController.connect("on_character_is_dead", on_character_is_dead)
	spawner.spawn_interval = 1.0

func on_character_is_dead(characer: Node):
	get_tree().reload_current_scene()
	
