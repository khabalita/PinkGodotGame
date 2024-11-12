extends Sprite2D
class_name moon

@export var value: int = 1


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is player:
		GameController.moon_collected(value)
		self.queue_free()
