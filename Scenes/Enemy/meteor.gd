extends Enemy
class_name Meteor

@export var speed : float = 200
@export var diagonal_angle : float = 45

var velocity : Vector2 = Vector2.ZERO

func _ready():
	var radians = deg_to_rad(diagonal_angle)
	velocity.x = speed * cos(radians)
	velocity.y = speed * sin(radians)

func _process(delta):
	position.x += velocity.x * delta
	position.y += velocity.y * delta
	if position.y > get_viewport().size.y or position.x < 0 or position.x > get_viewport().size.x:
		queue_free()
