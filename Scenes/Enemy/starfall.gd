extends Enemy
class_name Starfall

@export var change_direction_time : float = 2.0

var direction : int = 1
var timer : float = 0.0

func _ready():
	$Area2D.connect("body_entered", Callable(self, "_on_body_entered"))
	var radians = deg_to_rad(diagonal_angle)
	velocity.x = speed * cos(radians) * direction
	velocity.y = speed * sin(radians)
	
	rotation = velocity.angle()

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

func _on_body_entered(body: Node):
	if body is player:
		attack()
		queue_free()
