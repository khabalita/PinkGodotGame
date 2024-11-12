extends CharacterBody2D
class_name player


const move_speed : float = 100
const jump_speed : float = 300
@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sound = $sound/Jump
@onready var hurt_sound = $sound/Hurt
@onready var low_health_sound = $sound/Low_Health
var is_facing_right: bool = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass

func _physics_process(delta: float) -> void:
	move_x()
	flip()
	jump(delta)
	update_animations()
	move_and_slide()

func move_x():
	var input_axis = Input.get_axis("move_left", "move_right")
	velocity.x = input_axis * move_speed

func flip():
	if (is_facing_right and velocity.x < 0) or (not is_facing_right and velocity.x > 0):
		animated_sprite.scale.x *= -1
		is_facing_right = not is_facing_right

func jump(delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
		jump_sound.play()
	
	if not is_on_floor():
		velocity.y += gravity * delta

func update_animations():
	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
		return
	if velocity.x:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
