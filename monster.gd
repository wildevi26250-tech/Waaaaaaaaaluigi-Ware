extends AnimatedSprite2D

@onready var col2d: CollisionShape2D = $"../Node2D/hitbox/CollisionShape2D"
@export var MONSTER: AnimatedSprite2D
@export var MONSTER2: AnimatedSprite2D
@export var MONSTER3: AnimatedSprite2D

var Speed = 200
var non_stab = true



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MONSTER3.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if MONSTER3.non_stab == true:
		position.x -= Speed * delta
	if MONSTER3.non_stab == true:
		$Area2D/CollisionShape2D3.set_deferred("disabled", true)
