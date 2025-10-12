extends Node2D
@onready var enemy: Area2D = $"."
@onready var fase: Node2D = $"."



const speed = 300.00
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	enemy.position -= Vector2(fase.speed*2,0) * delta
	if enemy.position.x <= -14:
		queue_free()
	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		call_deferred("recarregar")
func recarregar():
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:	
	call_deferred("queue_free()")
