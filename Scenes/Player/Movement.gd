extends Node
class_name Movement

@export var acceleration = 1200.00
@export var friction = 1200.00
var player : player
var air_jump : bool
var gravity : int = ProjectSettings.get_setting("physics/2d/default_gravity")

func setup(body):
	player = body

func update(delta: float, direction: float):
	apply_gravity(delta)
	move(Vector2(direction, 0), delta)
	jump(delta)
	wall_slide()

func move(direction: Vector2, delta: float):
	player.velocity.x = move_toward(player.velocity.x, direction.x * player.move_speed, acceleration * delta)
	if direction.x == 0:
		player.velocity.x = move_toward(player.velocity.x, 0.0, friction * delta)

func apply_gravity(delta):
	if not player.is_on_floor():
		player.velocity.y += gravity * delta
		player.velocity.y = clampf(player.velocity.y, -1200, 980)

func jump(delta):
	if player.is_on_floor():
		air_jump = true
		if Input.is_action_just_pressed("jump"):
			player.velocity.y = - player.jump_speed
	elif Input.is_action_just_pressed("jump") and air_jump:
		player.velocity.y = - player.jump_speed * 0.8
		air_jump = false

func wall_slide():
	if not player.is_on_wall_only(): return
	if is_facing_wall(): return
	
	if player.velocity.y >= 0:
		player.velocity.y = player.velocity.y * 0.75
	if Input.is_action_pressed("move_down"):
		player.velocity.y = player.velocity.y * 1.3

func is_facing_wall():
	var wall_normal = player.get_wall_normal()
	return wall_normal.dot(Vector2(player.velocity.x, 0 )) < 0
