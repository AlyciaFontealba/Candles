extends Node2D
class_name ControlCanva

@export var canvas_modulate: CanvasModulate
@export var cake: Cake

func _ready():
	if cake:
		cake.cake_completed.connect(_on_cake_completed)
		
func _on_cake_completed():
	light_on()

func light_on():
	if canvas_modulate:
		canvas_modulate.visible = false
		print("Lumières allumées")
