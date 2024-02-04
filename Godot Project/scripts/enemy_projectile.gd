extends Area2D
#heart = normal (0)
#spade = all the way left or right (1)
#club = split 3 (2)
#diamond =  pause and zoom down (3)
#club2 = the baby clubs spawned (these don't rotate or spawn more clubs recursively)
@export var speed = 30
@export var suitSprites = []

var bulletType
var windowX = 540
var laneA = windowX * 1/6 - 270
var laneB = windowX * 3/6 - 270
var laneC = windowX * 5/6 - 270
var currentLifetime = 0
# 0 = left, 1 = right
var suitDirection
var rng = RandomNumberGenerator.new()

func _ready():
	$Sprite2D.texture = suitSprites[bulletType]
	if bulletType == 1 || bulletType == 2:	
		if suitDirection == 0:
			$Sprite2D.set_rotation(deg_to_rad(-90))
		else:
			$Sprite2D.set_rotation(deg_to_rad(90))

func _physics_process(delta):
	currentLifetime += 1.0 * delta
	#position += transform.y * speed * delta
	
	# heart, straight down
	if bulletType == 0 || bulletType == 4:
		position += transform.y * speed * delta
		
	# spade pick a direction and move there after a delay
	elif bulletType == 1:
		position += transform.y * speed * delta
		if suitDirection == 0:
			if currentLifetime >= 1:
				position.x = laneA
		else:	
			if currentLifetime >= 1:
				position.x = laneC
	
	# club split into three		
	elif bulletType == 2:
		if currentLifetime >= 0.75:
			queue_free()
			
	elif bulletType == 3:
		if currentLifetime < 0.5:
			position += transform.y * speed * delta
		elif currentLifetime >= 1:
			position += transform.y * speed * delta * 1.5
			
		

func _on_lifetime_timer_timeout():
	queue_free()

func _on_body_entered(body):
	queue_free()
	pass # Replace with function body.
