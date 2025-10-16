extends Node2D


@export var speed: float = 300.0
@export var time = 1.5
@export var canspawn: bool = true
var score = 0

@onready var label: Label = $Label

@onready var parallax_layer: Parallax2D = $ParallaxBackground/ParallaxLayer
@onready var parallax_layer_2: Parallax2D = $ParallaxBackground/ParallaxLayer2
@onready var parallax_layer_3: Parallax2D = $ParallaxBackground/ParallaxLayer3
@onready var tile_map_layer: TileMapLayer = $TileMapLayer








 
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if canspawn:
		score+= 1
		label.text = "Score: " + str(score)
		parallax_layer.scroll_offset.x -= speed * 0.1 * delta
		parallax_layer_2.scroll_offset.x -= speed * 0.26 * delta
		parallax_layer_3.scroll_offset.x -= speed * delta
		tile_map_layer.position -= Vector2(speed,0) * delta
		if tile_map_layer.position.x <= -900:
			tile_map_layer.position = Vector2(0,0)
	 


func _on_timer_timeout() -> void:
	speed += 5
	
	


 
