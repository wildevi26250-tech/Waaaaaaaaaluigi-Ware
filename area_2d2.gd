extends Area2D

@export var health := 30
@export var anim_tree: AnimatedSprite2D

@onready var monster: AnimatedSprite2D = %MONSTER
@onready var monster2: AnimatedSprite2D = %MONSTER2
@onready var monster3: AnimatedSprite2D = %MONSTER3

@onready var collision_shape: CollisionShape2D = $CollisionShape2D 

func _ready() -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player_attack"):
		print("hit")
		
		if anim_tree:
			anim_tree.play("die")
		
		collision_shape.set_deferred("disabled", true)
		
		monster2.non_stab = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	pass 

func _on_monster_animation_finished() -> void:
	queue_free()
