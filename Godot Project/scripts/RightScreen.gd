extends Node2D

@export var items_array: Array = []

@onready var randomPicker = $RandomPicker

func _ready():
	randomize()

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		var result1 = randomPicker.pick_random_item()
		get_node("Card1/Frames").animation = str(result1)
		get_node("Card1/Label").set_text((get_cardValue(result1)))
		
		var result2 = randomPicker.pick_random_item()
		get_node("Card2/Frames").animation = str(result2)
		get_node("Card2/Label").set_text((get_cardValue(result2)))
		
		var result3 = randomPicker.pick_random_item()
		get_node("Card3/Frames").animation = str(result3)
		get_node("Card3/Label").set_text((get_cardValue(result3)))
		
		var result4 = randomPicker.pick_random_item()
		get_node("Card4/Frames").animation = str(result4)
		get_node("Card4/Label").set_text((get_cardValue(result4)))
		
		var result5 = randomPicker.pick_random_item()
		get_node("Card5/Frames").animation = str(result5)
		get_node("Card5/Label").set_text((get_cardValue(result5)))

func get_cardValue(cardName):
	var cardValue = 0
	match cardName.left(1):
		"A":
			cardValue = 1
		"2":
			cardValue = 2
		"3":
			cardValue = 3
		"4":
			cardValue = 4
		"5":
			cardValue = 5
		"6":
			cardValue = 6
		"7":
			cardValue = 7
		"8":
			cardValue = 8
		"9":
			cardValue = 9
		"1":
			cardValue = 10
		"J":
			cardValue = 11
		"Q":
			cardValue = 12
		"K":
			cardValue = 12
	return str(cardValue)
