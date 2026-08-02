extends Node2D
class_name ControlCanva

@export var canvas_modulate: CanvasModulate
@export var cake: Cake
@export var player: PlayerController
@export var dialogue_node: Control

func _ready():
	if cake:
		cake.cake_completed.connect(_on_cake_completed)
		
	if dialogue_node:
		dialogue_node.visible = false
		
func _on_cake_completed():
	light_on()

func light_on():
	if canvas_modulate:
		canvas_modulate.visible = false
		print("Lumières allumées")
		
	if player:
		player.can_move = false
		player.direction = 0
		
	if dialogue_node:
		dialogue_node.visible = true
