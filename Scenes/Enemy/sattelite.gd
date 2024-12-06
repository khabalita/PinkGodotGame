extends Enemy
class_name Sattelite

@export var zigzag_amplitude : float = 50
@export var zigzag_speed : float = 3

var direction : int = 1

func _ready():
	pass

func _process(delta):
	position.x += direction * speed * delta
	position.y += sin(zigzag_speed * position.x) * zigzag_amplitude * delta
	
	if position.x < 0 or position.x > get_viewport().size.x:
		direction *= -1
