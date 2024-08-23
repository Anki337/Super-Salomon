extends Area2D

# Finds this through unique name hence the %
@onready var game_manager_var: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(_body: Node2D) -> void:
	print("coins collected:" + str(game_manager_var.score + 1) + " / " + str(game_manager_var.total_score))
	game_manager_var.add_score()
	animation_player.play("on_pickup")

func _on_ready() -> void:
	animated_sprite_2d.play("spin")
	
