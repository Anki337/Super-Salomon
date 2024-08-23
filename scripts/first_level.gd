extends Node2D

@onready var game_manager_var: Node = %GameManager
@onready var timer: Timer = $GameManager/Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
	#pass
	#
func _on_game_manager_ready() -> void:
	pass # Replace with function body.
	
func _on_next_level_body_entered(body: Node2D) -> void:
	if body is Player && game_manager_var.score == game_manager_var.total_score:
		Engine.time_scale = 0.5
		timer.start()
		
func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().call_deferred("change_scene_to_file","res://scenes/second_level.tscn")
