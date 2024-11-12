#Controller de vida para el personaje
class_name LifeController extends Node

@export var max_life: float = 3.0: set = _set_max_life, get = _get_max_life
@export var life: float = 3.0: set = _set_life, get = _get_life

func _ready() -> void:
	EventController.connect("on_life_ui_ready", on_event_life_ui_ready)

#setter del atributo life
func _set_life(value: float) -> void:
	var new_life = clamp(value, 0, max_life)
	if life != new_life:
		life = new_life
		EventController.emit_signal("on_life_changed", get_parent(), life)
		if value <= 0:
			dead()
	elif value > max_life:
		print("vida completa alcanzada")

#getter del atributo life
func _get_life() -> float:
	return life

#setter del atributo max_life
func _set_max_life(value: float) -> void:
	var parent: Node = get_parent()
	if parent:
		EventController.emit_signal("on_max_life_changed", parent, value)
		max_life = value
		var new_life = max_life - life
		healed(new_life)

#getter del atributo max_life
func _get_max_life() -> float:
	return max_life

#funcion de daño, disminuye el valor de life en -0.5
func hurt(value: float) -> void:
	print("daño recibido: ", value)
	_set_life(life - value)

#funcion de curacion, aumenta el valor de life en +0.5 
func healed(value: float) -> void:
	life = life + value

#funcion de vida maxima, cura la totalidad de la vida
#aun no implementada
func increassed_max_life(value: float) -> void:
	max_life = max_life + value

func dead():
	EventController.emit_signal("on_character_is_dead", get_parent())

#Funcion que emite señales de cambo de vida y cambio de vida maxima, provenientes de autoload EventController
func on_event_life_ui_ready(node: Node) -> void:
	EventController.emit_signal("on_life_changed", node, life)
	EventController.emit_signal("on_max_life_changed", node, max_life)
