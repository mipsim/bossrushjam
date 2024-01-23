extends Area2D

const bullet_scene = preload("res://scenes/enemy_projectile.tscn")

@onready var shoot_timer = $ShootTimer

func _ready():
	$"Shoot1-A".start()

func _on_shoot_1a_timeout():
	var bullet1 = bullet_scene.instantiate()
	bullet1.position = Vector2(100.0, 0.0)
	get_parent().add_child(bullet1)
	$"Shoot1-B".start()

func _on_shoot_1b_timeout():
	var bullet2 = bullet_scene.instantiate()
	bullet2.position = Vector2(500.0, 0.0)
	get_parent().add_child(bullet2)
	$"Shoot1-C".start()


func _on_shoot_1c_timeout():
	var bullet3 = bullet_scene.instantiate()
	bullet3.position = Vector2(300.0, 0.0)
	get_parent().add_child(bullet3)
	$ShootWait.start()


func _on_shoot_wait_timeout():
	$"Shoot1-A".start()
