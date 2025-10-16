extends Node2D

@onready var fase: Node2D = $".."

var enemy =[
	preload("res://enemy.tscn"),
	preload("res://enemy_2.tscn")
]
var choice: int

var randomizer = 0

@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func canSpawn(num:int):
	if num == 1:
		fase.canSpawn = false	


func _on_timer_timeout() -> void:
	randomizer = randi_range(0,4)
	choice = randi_range(0,1)
	if fase.time >= 0.8:
		fase.time -= 0.01
	timer.wait_time = fase.time
	print(timer.wait_time)
	if fase.canspawn:
		if randomizer != 0:
			var enemy_teste = enemy.pick_random()
			var enemy_instance = enemy_teste.instantiate()
			add_sibling(enemy_instance)
			enemy_instance.global_position = global_position
