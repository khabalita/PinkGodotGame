extends Area2D

#funcion encargada de recargar la escena si el jugador cae en un area especifica
func _on_body_entered(body: Node2D) -> void:
	if body is player:
		get_tree().reload_current_scene()
