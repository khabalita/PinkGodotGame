extends Area2D
class_name Enemy


@onready var animated_sprite = $Sprite2D

func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is player:
		queue_free()
