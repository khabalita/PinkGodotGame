extends Node

var total_moons: int = 0

#Actualiza el valor de total_moons cuando se emite la señal
func moon_collected(value: int):
	total_moons += value
	EventController.emit_signal("moon_collected", total_moons)
