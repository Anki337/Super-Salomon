extends Node2D

const SPEED = 20
var direction = 1


# Right + Left RayCast collision arrows.
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
# var to set sprite H property when collision occurs.
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#If raycast right is hitting something?
	if ray_cast_right.is_colliding():
		# Change X to negative value and go left.
		direction = -1
		animated_sprite_2d.flip_h = true
	#If raycast left is hitting something?
	if ray_cast_left.is_colliding():
		# Change X to positive value and go right.
		direction = 1
		animated_sprite_2d.flip_h = false
		
	position.x += direction * SPEED * delta
