extends Area2D
class_name asteroid

var speed = 100
var random_y = 0
@export var damage: float = 0.5

func _ready() -> void:
	random_y = randf_range(0, get_viewport().size.y)

func _physics_process(delta: float) -> void:
	move_x(delta)


func _on_body_entered(body: Node2D) -> void:
	if body is player:
		for child in body.get_children():
			if child is LifeController:
				print("danio")
				child.hurt(damage)

func move_x(delta):
	position.x -= speed * delta
	var viewport_size = get_viewport().size
	if position.x < -viewport_size.x:
		position.x = viewport_size.x
