extends Node2D

@onready var timer: RichTextLabel = $timer

var time: float

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	timer.text = str(snapped(time, 0.1))

func Timer(start_time: float) -> void:
	time = start_time
	
	while time > 0.0:
		await get_tree().create_timer(0.1).timeout
		time -= 0.1
