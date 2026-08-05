extends Node2D
class_name ControlCanva

@export var canvas_modulate: CanvasModulate
@export var cake: Cake
@export var player: PlayerController
@export var dialogue_node: Control

var music_player : AudioStreamPlayer

func _ready():
	
	if music_player == null:
		music_player = AudioStreamPlayer.new()
		add_child(music_player)
		music_player.process_mode = Node.PROCESS_MODE_ALWAYS
		
	if cake:
		cake.cake_completed.connect(_on_cake_completed)
		
	if dialogue_node:
		dialogue_node.visible = false
		
func play_sfx(sound_path: String):
	var stream = load(sound_path)
	if stream:
		var audio_player = AudioStreamPlayer.new()
		add_child(audio_player)
		audio_player.stream = stream
		audio_player.pitch_scale = randf_range(0.9, 1.1) 
		audio_player.play()
		audio_player.finished.connect(audio_player.queue_free)
	else:
		push_error("Impossible de trouver le fichier son : " + sound_path)
		
func _on_cake_completed():
	light_on()

func light_on():
	if canvas_modulate:
		canvas_modulate.visible = false
		print("Lumières allumées")
		
	if player:
		player.can_move = false
		player.direction = 0
		player.disable_light()
		
	if dialogue_node:
		dialogue_node.visible = true
