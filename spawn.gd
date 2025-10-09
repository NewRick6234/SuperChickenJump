extends Node2D

@onready var fase: Node2D = $".."


@export var enemy: PackedScene
var randomizer = 0

@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
	


func _on_timer_timeout() -> void:
	randomizer = randi_range(0,2)
	if fase.time >= 0.8:
		fase.time -= 0.01
	timer.wait_time = fase.time
	print(timer.wait_time)
	if randomizer == 1 or randomizer ==2:
		var enemy_instance = enemy.instantiate()
		add_sibling(enemy_instance)
		enemy_instance.global_position = global_position
