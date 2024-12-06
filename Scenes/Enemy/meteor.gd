extends Enemy
class_name Meteor

func _ready():
	$Area2D.connect("body_entered", Callable(self, "_on_body_entered"))
	var radians = deg_to_rad(diagonal_angle)
	velocity.x = speed * cos(radians)
	velocity.y = speed * sin(radians)
	
	rotation = velocity.angle()

func _process(delta):
	position.x += velocity.x * delta
	position.y += velocity.y * delta
	if position.y > get_viewport().size.y or position.x < 0 or position.x > get_viewport().size.x:
		queue_free()

func _on_body_entered(body: Node):
	if body is player:
		attack()
		queue_free()
