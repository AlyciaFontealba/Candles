extends Area2D
class_name Cake

signal cake_completed

@export var prompt_label: Label
@export var dialogue_label: Label


var player_in_range: PlayerController = null
var is_completed: bool = false

func _ready():
	# On cache les éléments de UI au départ
	if prompt_label:
		prompt_label.hide()
	if dialogue_label:
		dialogue_label.hide()

func _process(_delta):
	# Si le joueur est à côté, qu'il appuie sur E et que le gâteau n'est pas encore fini
	if player_in_range and Input.is_action_just_pressed("interact") and not is_completed:
		interact()
		print("A intéragi avec le gâteau")

func interact():
	if player_in_range.has_all_candles():
		is_completed = true
		if prompt_label:
			prompt_label.hide()
		if dialogue_label:
			dialogue_label.hide()
		
		print("Gâteau complété")
		cake_completed.emit()
		
	else:
		if dialogue_label:
			dialogue_label.text = "Mince, je n'ai pas assez de bougies..."
			dialogue_label.show()
		return false

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController and not is_completed:
		player_in_range = body
		if prompt_label: prompt_label.show()


func _on_body_exited(body: Node2D) -> void:
	if body is PlayerController:
		player_in_range = null
		if prompt_label: prompt_label.hide()
		if dialogue_label: dialogue_label.hide()
