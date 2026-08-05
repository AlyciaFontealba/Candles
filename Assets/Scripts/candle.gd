extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		body.add_candle()
		AreaController.play_sfx("res://Assets/Audio/get_candle.wav")
		queue_free()
