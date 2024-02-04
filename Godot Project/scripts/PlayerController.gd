extends CharacterBody2D

# Paddle properties
var speed = 20000  # Adjust the speed of the paddle
var maxX = 840   # Adjust the maximum X position of the paddle
var minX = -100     # Adjust the minimum X position of the paddle

# Called every frame
func _process(delta):
	# Player input
	var input_x = 0
	if Input.is_action_pressed("ui_left"):
		input_x -= 1
	if Input.is_action_pressed("ui_right"):
		input_x += 1

	# Move the paddle based on input
	velocity.x = input_x * speed * delta
	move_and_slide()

	# Clamp the paddle's Y position to stay within the screen bounds
	position.x = clamp(position.x, minX, maxX)
