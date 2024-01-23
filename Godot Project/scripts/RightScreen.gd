extends Node2D

@export var items_array: Array = []

@onready var randomPicker = $RandomPicker

func _ready():
	randomize()

func _physics_process(delta):
	
	
	if Input.is_action_just_pressed("ui_accept"):
		var result = randomPicker.pick_random_item()
		print(result)
		get_node("Card1/Frames").animation = str(result)
