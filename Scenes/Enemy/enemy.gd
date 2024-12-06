extends Node2D
class_name Enemy


@onready var animated_sprite = $Sprite2D
@export var damage : int = 0
@export var speed : float = 0.0
@export var diagonal_angle : float = 0.0

var velocity : Vector2 = Vector2.ZERO

func _ready() -> void:
	pass

func _process(delta):
	position += velocity * delta
	if position.y > get_viewport().size.y or position.x < 0 or position.x > get_viewport().size.x:
		for child in get_children():
			if child is Light2D:
				child.queue_free()
		queue_free()

func attack():
	EventController.emit_signal("enemy_attacked", damage)
