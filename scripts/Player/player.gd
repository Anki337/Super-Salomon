extends CharacterBody2D

class_name Player

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var character_jump_sound: AudioStreamPlayer2D = $CharacterJumpSound


const SPEED = 130.0
const JUMP_VELOCITY = -300.0




func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		character_jump_sound.play()
		
	# Gets the input direction
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flips the sprite.
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	# Play animations:
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	if not is_on_floor():
		animated_sprite_2d.play("jump")
		
	# takes the input <- -> and applies the speed, eg . move.
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
