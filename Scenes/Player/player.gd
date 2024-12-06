extends CharacterBody2D
class_name player

const move_speed : float = 100
const jump_speed : float = 300
@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sound = $sound/Jump
@onready var hurt_sound = $sound/Hurt
@onready var low_health_sound = $sound/Low_Health
@onready var movement : Movement = $"Movement" as Movement
@onready var animations : Animations = $Animation as Animations

var is_facing_right: bool = true

func _ready():
	movement.setup(self)

func _physics_process(delta: float) -> void:
	movement.update(delta, Input.get_axis("move_left","move_right"))
	movement.jump(delta)
	flip()
	move_and_slide()
	animations.update_animations(velocity, is_on_floor())

func flip():
	if (is_facing_right and velocity.x < 0) or (not is_facing_right and velocity.x > 0):
		animated_sprite.scale.x *= -1
		is_facing_right = not is_facing_right
