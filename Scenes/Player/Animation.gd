extends Node
class_name Animations

@onready var animated_sprite: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var movement: Movement = $"../Movement"

func update_animations(velocity: Vector2, is_on_floor: bool) -> void:
	if not is_on_floor:
		if velocity.y < 0:
			check_air_jump()
		else:
			animated_sprite.play("fall")
		return
	check_is_facing_wall()
	if velocity.x:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")

func check_air_jump():
	if movement.air_jump:
		animated_sprite.play("double_jump")
	else:
		animated_sprite.play("jump")

func check_is_facing_wall():
	if movement.is_facing_wall():
		animated_sprite.play("wall_jump")
