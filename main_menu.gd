extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_btn_start_pressed() -> void:
	$Timer.start()
	$playSound.play()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://fase.tscn")
