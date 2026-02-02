extends Node2D

var score := [0, -1] # Index 0:Player, 1:CPU
const paddle_speed := 500
@onready var player_lbl: Label = $Control/PlayerLBL
@onready var cpulbl: Label = $Control/CPULBL
@onready var ball_timer: Timer = $BallTimer


func _on_ball_timer_timeout() -> void:
	$BALL.new_ball()


func _on_score_right_body_entered(body: Node2D) -> void:
	score[0] += 1
	player_lbl.text = str(score[0]) 
	ball_timer.start()


func _on_score_left_body_entered(body: Node2D) -> void:
	score[1] += 1
	cpulbl.text = str(score[1])
	ball_timer.start()
