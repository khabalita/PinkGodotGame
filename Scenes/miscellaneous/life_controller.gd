#Controller de vida para el personaje
class_name LifeController extends Node

var max_life: float = 20.0
var current_life: float = max_life

func take_damage(amount: float):
	current_life = max(current_life - amount, 0)
	EventController.emit_signal("on_life_changed", current_life)
	if current_life <= 0:
		EventController.emit_signal("on_character_is_dead")

func heal(amount: float):
	current_life = min(current_life + amount, max_life)
	EventController.emit_signal("on_life_changed", current_life)
