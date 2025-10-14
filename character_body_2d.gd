extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var fall_multiplier: float = 1.5
@export var gravity: float = 900.0
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var fase: Node2D = $".."
@onready var dano_sound: AudioStreamPlayer2D = $DanoSound


func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	if not is_on_floor():
		if velocity.y < 0:
			velocity.y += gravity * delta	
		else:
			velocity.y += gravity * fall_multiplier * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	 
	move_and_slide()




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		fase.canspawn = false
		dano_sound.play()
		$Timer.start()
	


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
