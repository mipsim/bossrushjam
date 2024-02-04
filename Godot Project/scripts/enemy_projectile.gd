extends Area2D

@export var speed = 30

func _physics_process(delta):
	position += transform.y * speed * delta

func _on_lifetime_timer_timeout():
	queue_free()

func _on_body_entered(body):
	print("touched")
	queue_free()
	pass # Replace with function body.
