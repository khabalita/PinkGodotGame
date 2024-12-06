#Controladora de señales
extends Node

#transition
signal level_completed

#life
signal on_life_ui_ready(node: Node)
signal on_life_changed(node: Node, new_life: float)
signal on_max_life_changed(node: Node, new_life: float)
signal on_character_is_dead(parent)

#moon
signal moon_collected(value: int)

#enemy
signal enemy_attacked(damage)
