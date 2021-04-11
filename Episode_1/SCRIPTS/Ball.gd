extends KinematicBody2D


var speed = 40
var velocity = Vector2(0,0)
var direction = 1
var stop = false

# Called when the node enters the scene tree for the first time.
func _ready():
	stop = true
	velocity.x = -speed
	velocity.y = -speed
	pass # Replace with function body.

func _physics_process(delta):
	
	if stop:
		$".".hide()
		$".".position.x = Globals.Width / 2 + 4
		$".".position.y = Globals.Height / 2 + 4
		pass
	else:
	
		velocity = move_and_slide(velocity)
	
	pass
