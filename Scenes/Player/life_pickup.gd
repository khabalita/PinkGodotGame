extends Node2D

@export var life: float = 0.5

#funcion que llama a la controladora de vida y actualiza la vida 
#mediante la funcion healed una vez que el personaje toma la vida
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is player:
		for child in body.get_children():
			if child is LifeController:
				child.healed(life)
		self.queue_free()
