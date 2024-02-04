extends CharacterBody2D

var heart = preload("res://scenes/enemy_projectile.tscn")
var spade = preload("res://scenes/enemy_projectile.tscn")
var club = preload("res://scenes/enemy_projectile.tscn")
var club2 = preload("res://scenes/enemy_projectile.tscn")
var diamond = preload("res://scenes/enemy_projectile.tscn")
var joker
var rng = RandomNumberGenerator.new()
var windowX = 540
var laneA = windowX * 1/6 - 270
var laneB = windowX * 3/6 - 270
var laneC = windowX * 5/6 - 270
var laneArray = [laneA, laneB, laneC]
var pauseQueue = [3,2,1]
var bulletPatterns # if we need to create patterns
var bulletTypes = [heart,spade,club,diamond,club2]
# conceptually, takes in tuples of (bulletType, lane), this will be spat out by boss
#var bulletQueue = [Vector2(1,1),Vector2(1,2),Vector2(1,3),Vector2(0,0),]
var bulletQueue = []
var maxFireDelay = 1.5
var fireDelay
var clubCounter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(windowX / 2, 100)
	fireDelay = maxFireDelay
	for i in 10:
		reloadBullet()
	for bullet in bulletQueue:
				print(bulletQueue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fireDelay < 0 && !bulletQueue.is_empty():
		# pop front of bullet queue out to ID the type of bullet being used, then instantiate
		var currentBullet = bulletQueue.pop_front()
		var projectile_instance = bulletTypes[currentBullet.x].instantiate()
			
		# pick from lanes A-C depending on current bullet
		projectile_instance.global_position = Vector2(laneArray[currentBullet.y], 25)
		projectile_instance.bulletType = currentBullet.x
		projectile_instance.suitDirection = rng.randi_range(0,1)
		add_child(projectile_instance)
		
		if currentBullet.x == 2:
			clubCounter = 3
			if projectile_instance.suitDirection == 0:
				bulletQueue.push_front(Vector2(4,0))
				bulletQueue.push_front(Vector2(4,1))
				bulletQueue.push_front(Vector2(4,2))
			else:
				bulletQueue.push_front(Vector2(4,2))
				bulletQueue.push_front(Vector2(4,1))
				bulletQueue.push_front(Vector2(4,0))
			
		# add new bullet to back of queue
		if clubCounter == 0: 
			fireDelay = maxFireDelay
		else:
			fireDelay = maxFireDelay / 2
			clubCounter -= 1.0 * delta
			
		reloadBullet()
		#for bullet in bulletQueue:
			#print(bulletQueue)
			#fireDelay = rng.randi_range(2,5)
	else: 
		fireDelay -= 1.0 * delta
		
func reloadBullet():
	bulletQueue.append(Vector2(rng.randi_range(0,3),rng.randi_range(0,2)))
		
