extends Node2D

@export var items_array: Array = []

@onready var randomPicker = $RandomPicker

func _ready():
	randomize()

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		var result1 = randomPicker.pick_random_item()
		get_node("Card1/Frames").animation = str(result1)
		var result2 = randomPicker.pick_random_item()
		get_node("Card2/Frames").animation = str(result2)
		var result3 = randomPicker.pick_random_item()
		get_node("Card3/Frames").animation = str(result3)
		var result4 = randomPicker.pick_random_item()
		get_node("Card4/Frames").animation = str(result4)
		var result5 = randomPicker.pick_random_item()
		get_node("Card5/Frames").animation = str(result5)
