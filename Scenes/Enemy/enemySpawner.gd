extends Node

@onready var meteor_scene = preload("res://Scenes/Enemy/meteor.tscn")
@onready var sattelite_scene = preload("res://Scenes/Enemy/sattelite.tscn")
@onready var starfall_scene = preload("res://Scenes/Enemy/starfall.tscn")

@export var spawn_interval : float = 1.0
var timer : float = 0.0

func _ready():
	pass

func _process(delta):
	timer += delta
	if timer >= spawn_interval:
		spawn_meteor()
		spawn_starfall()
	

func spawn_meteor():
	var meteor = meteor_scene.instantiate()
	meteor.positon = Vector2(randf_range(0, get_viewport().size.x), 0)
	add_child(meteor)

func spawn_sattelite():
	var sattelite = sattelite_scene.instantiate()
	sattelite.positon = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	add_child(sattelite)

func spawn_starfall():
	var starfall = starfall_scene.instantiate()
	starfall.position = Vector2(randf_range(0, get_viewport().size.x), 0)
	add_child(starfall)
