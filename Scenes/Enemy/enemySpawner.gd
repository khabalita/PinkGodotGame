extends Node

@onready var meteor_scene = preload("res://Scenes/Enemy/meteor.tscn")
@onready var sattelite_scene = preload("res://Scenes/Enemy/sattelite.tscn")
@onready var starfall_scene = preload("res://Scenes/Enemy/starfall.tscn")
@onready var acid_rain_scene = preload("res://Scenes/Enemy/acid_rain.tscn")
@onready var gamma_rays_scene = preload("res://Scenes/Enemy/gamma_rays.tscn")

@export var spawn_interval : float = 1.0
var timer : float = 0.0

func _ready():
	pass

func _process(delta):
	timer += delta
	if timer >= spawn_interval:
		spawn_meteor()
		spawn_starfall()
		spawn_acid_rain()
		spawn_gamma_rays()
		timer = 0.0

func spawn_meteor():
	var meteor = meteor_scene.instantiate()
	meteor.position = Vector2(randf_range(0, get_viewport().size.x), 0)
	get_parent().add_child(meteor)

func spawn_sattelite():
	var sattelite = sattelite_scene.instantiate()
	sattelite.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	get_parent().add_child(sattelite)

func spawn_starfall():
	var starfall = starfall_scene.instantiate()
	starfall.position = Vector2(randf_range(0, get_viewport().size.x), 0)
	get_parent().add_child(starfall)

func spawn_acid_rain():
	var acid_rain = acid_rain_scene.instantiate()
	acid_rain.position = Vector2(randf_range(0, get_viewport().size.x), 0)
	get_parent().add_child(acid_rain)

func spawn_gamma_rays():
	var gamma_rays = gamma_rays_scene.instantiate()
	gamma_rays.position = Vector2(randf_range(0, get_viewport().size.x), 0)
	get_parent().add_child(gamma_rays)
