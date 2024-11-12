extends Node2D

@export var life: float = 0.5


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is player:
		for child in body.get_children():
			if child is LifeController:
				child.healed(life)
		self.queue_free()
