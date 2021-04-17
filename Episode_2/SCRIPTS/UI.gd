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
	
	if reset_time > 0:
		reset_time -= delta
		$Ball_Reset.text = "Ball will spawn in " + str(round(reset_time)) + " seconds"
	if reset_time < 0:
		reset_time = 0 
		score = true
		$Ball_Reset.text = "Ball will spawn in " + str(reset_time) + " seconds"
		$Ball_Reset.hide()
		emit_signal("respawn_ball")
	
	if gameover_time > 0 && $Score_Left.text == "7":
		gameover_time -= delta
		$Win_Message.text = "Left player wins would you like to play again! Y/N\n" + str(round(gameover_time)) + " seconds"
		if(Input.is_action_pressed("ui_accept")):
			emit_signal("restart_game")
			gameover_time = 0
			$Score_Left.text = "0"
			$Score_Right.text = "0"
			$Win_Message.text = ""
		elif Input.is_action_just_pressed("ui_cancel"):
			get_tree().quit() 
		elif gameover_time < 0:
			get_tree().quit() 
	if gameover_time > 0 && $Score_Right.text == "1":
		gameover_time -= delta
		$Win_Message.text = "Right player wins would you like to play again! Y/N\n" + str(round(gameover_time)) + " seconds"
		if(Input.is_action_pressed("ui_accept")):
			emit_signal("restart_game")
			gameover_time = 0
			$Score_Left.text = "0"
			$Score_Right.text = "0"
			$Win_Message.text = ""
		elif Input.is_action_just_pressed("ui_cancel"):
			get_tree().quit() 
		elif gameover_time < 0:
			get_tree().quit() 
	
	pass

func _on_Timer_Ball_Reset_timeout():
	reset_time = 3
	
	$Ball_Reset.text = "Ball will spawn in " + str(reset_time) + " seconds"
	$Ball_Reset.show()
	pass # Replace with function body.


func _on_Timer_Win_Message_timeout():
	gameover_time = 10
	
	$ColorRect.show()
	if $Score_Left.text == "7":
		$Win_Message.text = "Left player wins would you like to play again Y/N\n" + str(gameover_time) + " seconds"
	if $Score_Right.text == "7":
		$Win_Message.text = "Right player wins would you like to play again Y/N\n" + str(gameover_time) + " seconds"
	pass # Replace with function body.
