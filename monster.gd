extends AnimatedSprite2D

@export var MONSTER: AnimatedSprite2D

var Speed = 200


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MONSTER.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= Speed * delta
