extends Area2D

@export var next_level : String

#funcion que emite una señal cuando el player entra en el area
#luego llama a change_level y le paso el atributo next_level
#que recibe un string con la direccion de la proxima escena
func _on_body_entered(body: Node2D) -> void:
	if body is player:
		EventController.level_completed.emit()
		change_level()

func change_level():
	get_tree().change_scene_to_file(next_level)
