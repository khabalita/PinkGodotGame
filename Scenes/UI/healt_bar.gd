extends Control
class_name HealthUI

@onready var life_bar : ProgressBar = $LifeBar

func _ready() -> void:
	EventController.connect("on_life_changed", Callable(self, "update_life"))

func update_life(new_life: float):
	life_bar.value = new_life

func set_max_life(max_health: float):
	life_bar.max_value = max_health
