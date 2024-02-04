extends Node2D

@export var items_array: Array = []

@onready var randomPicker = $RandomPicker

var selected_cards: Array = [false,false,false,false,false]
var card_values: Array = [0,0,0,0,0]
var seen_numbers = {}

func _ready():
	randomize()

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		var result1 = randomPicker.pick_random_item()
		get_node("Card1/Frames").animation = str(result1)
		get_node("Card1/Label").set_text((get_cardValue(result1)))
		card_values[0] = get_cardValue(result1)
		
		var result2 = randomPicker.pick_random_item()
		get_node("Card2/Frames").animation = str(result2)
		get_node("Card2/Label").set_text((get_cardValue(result2)))
		card_values[1] = get_cardValue(result2)
		
		var result3 = randomPicker.pick_random_item()
		get_node("Card3/Frames").animation = str(result3)
		get_node("Card3/Label").set_text((get_cardValue(result3)))
		card_values[2] = get_cardValue(result3)
		
		var result4 = randomPicker.pick_random_item()
		get_node("Card4/Frames").animation = str(result4)
		get_node("Card4/Label").set_text((get_cardValue(result4)))
		card_values[3] = get_cardValue(result4)
		
		var result5 = randomPicker.pick_random_item()
		get_node("Card5/Frames").animation = str(result5)
		get_node("Card5/Label").set_text((get_cardValue(result5)))
		card_values[4] = get_cardValue(result5)
		
		# Check if there are duplicates in the hand of 5 cards
		print("Cards on table: " + str(card_values))
		for i in card_values:
			if seen_numbers.has(i):
				return true
			else:
				seen_numbers[i] = true
		
		print(seen_numbers)

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
			cardValue = 10
		"Q":
			cardValue = 10
		"K":
			cardValue = 10
	return str(cardValue)


func _on_card_1_button_pressed():
	if !selected_cards[0]:
		selected_cards[0] = true
		get_node("Card1/Frames").position.y = 528
	else:
		selected_cards[0] = false
		get_node("Card1/Frames").position.y = 548
	cardsScore()

func _on_card_1_button_mouse_entered():
	pass

func _on_card_1_button_mouse_exited():
	pass

func cardsScore():
	var selected_values: Array = []
	
	for i in card_values.size():
		if selected_cards[i]:
			selected_values.push_back(card_values[i])
