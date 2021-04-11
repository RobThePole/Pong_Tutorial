extends CanvasLayer


signal score
signal respawn_ball
signal restart_game

var reset_time = 0
var gameover_time = 0
var score = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_on_Timer_Ball_Reset_timeout()
	pass # Replace with function body.

func _process(delta):
	pass

func _on_Timer_Ball_Reset_timeout():
	print("Ball Respawn")
	pass # Replace with function body.


func _on_Timer_Win_Message_timeout():
	pass # Replace with function body.
