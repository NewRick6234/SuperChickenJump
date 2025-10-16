extends StaticBody2D

var speed = 400
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position -= Vector2(speed*2,0) * delta
	if position.x <= -14:
		queue_free()
