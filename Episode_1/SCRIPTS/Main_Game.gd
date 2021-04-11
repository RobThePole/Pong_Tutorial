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

