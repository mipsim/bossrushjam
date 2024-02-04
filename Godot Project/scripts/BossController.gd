extends CharacterBody2D

var projectile = preload("res://scenes/enemy_projectile.tscn")
var windowX = 540
var laneA = windowX * 1/6
var laneB = windowX * 3/6
var laneC = windowX * 5/6
var laneArray = [laneA, laneB, laneC]
var maxFireDelay = 1
var fireDelay

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(windowX / 2, 100)
	fireDelay = maxFireDelay
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fireDelay < 0:
		var projectile_instance = projectile.instantiate()
		add_child(projectile_instance)
		projectile_instance.global_position = Vector2(laneArray.pick_random(), 100)
		fireDelay = maxFireDelay
	else: 
		fireDelay -= 1.0 * delta
	pass
