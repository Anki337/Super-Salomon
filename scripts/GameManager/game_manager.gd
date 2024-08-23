extends Node

class_name game_manager

var total_score : int = 0
var score : int = 0

@onready var score_label: Label = $"../Labels/ScoreLabel"


func add_score():
	score += 1
	if score >= 1 and score < total_score:
		score_label.text = "Bra Salomon! Du har hittat " + str(score) + " / " + str(total_score) + " mynt! Försök hitta alla ! "
	elif score == total_score:
		score_label.text = "Bra Salomon! Du har hittat alla mynten och klarat banan!"
	
func _on_coins_child_entered_tree(_node: Node) -> void:
	total_score += 1
func _on_labels_ready() -> void:
	pass # Replace with function body.
