extends AnimatedSprite2D

@onready var col2d: CollisionShape2D = $"../Node2D/hitbox/CollisionShape2D"
@export var MONSTER: AnimatedSprite2D
@onready var timer: Timer= $"../Timer"

var Speed = 200
var non_stab = true



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MONSTER.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if non_stab == true:
		position.x -= Speed * delta
	if non_stab == false:
		$Area2D/CollisionShape2D1.set_deferred("disabled", true)
