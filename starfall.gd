extends Enemy
class_name Starfall

@export var speed : float = 100
@export var diagonal_angle : float = 45
@export var change_direction_time : float = 2.0

var direction : int = 1
var timer : float = 0.0
var velocity : Vector2 = Vector2.ZERO

func _ready():
	var radians = deg_to_rad(diagonal_angle)
	velocity.x = speed * cos(radians) * direction
	velocity.y = speed * sin(radians)

func _process(delta):
	position.x += velocity.x * delta
	position.y += velocity.y * delta
	timer += delta
	if timer >= change_direction_time:
		direction *= -1
		velocity.x = speed * cos(deg_to_rad(diagonal_angle)) * direction
		timer = 0.0
	if position.y > get_viewport().size.y or position.x < 0 or position.x > get_viewport().size.x:
		queue_free()
