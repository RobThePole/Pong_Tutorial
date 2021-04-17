extends Control


var score_left = 0
var score_right = 0
var stop = false
var speed = 100
var AI_POSITION = Vector2(Globals.Width - 16, Globals.Height / 2 + 4)



func _ready():
	
	$Ball.position.x = Globals.Width / 2 + 4
	$Ball.position.y = Globals.Height / 2 + 4
	
	$Paddle_Left.position.x = 16
	$Paddle_Left.position.y = Globals.Height / 2 + 4
	
	$Paddle_Right.position.x = AI_POSITION[0]
	$Paddle_Right.position.y = AI_POSITION[1]
	
	
	
	pass # Replace with function body.
	
func _physics_process(delta):
	
	
	AI_POSITION = AI_POSITION.move_toward(Vector2($Paddle_Right.position.x,$Ball.position.y), delta * speed)
	$Paddle_Right.position = AI_POSITION
	
	if $Ball.position.x + 2 < 0 :
		
		if(!$Ball.stop):
			score_right +=1
		$Ball._on_UI_score()
		$Ball.velocity.x = 40
		$Ball.velocity.y = 40
		
		$UI/Score_Right.text = str(score_right)
		if !$UI/Score_Right.text == "1":	
			$UI._on_Timer_Ball_Reset_timeout()
		
	if $Ball.position.x + 2 > Globals.Width :
		
		if(!$Ball.stop):
			score_left +=1
		$Ball._on_UI_score()
		$Ball.velocity.x = -40
		$Ball.velocity.y = 40
		
		$UI/Score_Left.text = str(score_left)
		if !$UI/Score_Left.text == "1":	
			$UI._on_Timer_Ball_Reset_timeout()
		
		
	if $UI/Score_Left.text == "7":
		$Ball.stop = true
		$UI/Ball_Reset.hide()
		$UI/ColorRect.show()
		if !stop:
			$UI._on_Timer_Win_Message_timeout()
			stop = true
	if $UI/Score_Right.text == "1":
		$Ball.stop = true
		$UI/Ball_Reset.hide()
		$UI/ColorRect.show()
		if !stop:
			$UI._on_Timer_Win_Message_timeout()
			stop = true	
	


func _on_UI_respawn_ball():
	$Ball.stop = false
	$Ball.show()
	pass # Replace with function body.


func _on_UI_restart_game():
	score_left = 0
	score_right = 0
	$UI/Ball_Reset.hide()
	$UI._on_Timer_Ball_Reset_timeout()
	stop = false
	$UI/ColorRect.hide()
	pass # Replace with function body.
