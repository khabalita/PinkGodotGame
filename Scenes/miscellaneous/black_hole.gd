extends Area2D

@export var next_level : String

func _on_body_entered(body: Node2D) -> void:
	if body is player:
		EventController.level_completed.emit()
		change_level()

func change_level():
	get_tree().change_scene_to_file(next_level)
