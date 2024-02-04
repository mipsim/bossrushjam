extends CharacterBody2D

var projectile = preload("res://scenes/enemy_projectile.tscn")
var blank
var windowX = 540
var laneA = windowX * 1/6
var laneB = windowX * 3/6
var laneC = windowX * 5/6
var laneArray = [blank, laneA, laneB, laneC]
var pauseQueue = [3,2,1]
var bulletPatterns # if we need to create patterns
var bulletTypes = [blank,projectile]
# conceptually, takes in tuples of (bulletType, lane), this will be spat out by boss
var bulletQueue = [Vector2(1,1),Vector2(0,0),Vector2(1,2),Vector2(0,0),Vector2(1,3),Vector2(0,0),]
var maxFireDelay = 1
var fireDelay

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(windowX / 2, 100)
	fireDelay = maxFireDelay
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fireDelay < 0 && !bulletQueue.is_empty():
		# pop front of bullet queue out to ID the type of bullet being used, then instantiate
		var currentBullet = bulletQueue.pop_front()
		if currentBullet.x != 0:
			var projectile_instance = bulletTypes[currentBullet.x].instantiate()
			add_child(projectile_instance)
			
			# pick from lanes A-C depending on current bullet
			projectile_instance.global_position = Vector2(laneArray[currentBullet.y], 100)
			fireDelay = maxFireDelay
		else:
			fireDelay = pauseQueue.pop_front()
	else: 
		fireDelay -= 1.0 * delta
