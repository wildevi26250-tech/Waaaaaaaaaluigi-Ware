extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer
@onready var brickObject = preload("res://brick.tscn")

var columns = 32 # number of columns of blocks
var rows = 7 # number of rows of blocks
var margin = 50 # distance from edge of screen
var timer_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setupLevel()
	await themed_timer.Timer(20.0)
	#after this is completed...
	timer_end = true # Replace with function body.
	
func setupLevel():
	for r in rows:
		for c in columns:
			
				var newBrick = brickObject.instantiate()
				add_child(newBrick)
				newBrick.position = Vector2(margin + (34 * c), margin + (34 * r))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://level_scene.tscn")
