# TO-DO
# Polish

extends Node2D

@export var items_array: Array = []

@onready var randomPicker = $RandomPicker

var selected_cards: Array = [false,false,false,false,false]
var card_values: Array = [0,0,0,0,0]
var attack = 0
var bossHealth = 100
var validAction = true
var damageSent = false

func _ready():
	randomize()
	
	var result1 = randomPicker.pick_random_item()
	get_node("Card1/Frames").animation = str(result1)
	card_values[0] = get_cardName(result1)
	
	var result2 = randomPicker.pick_random_item()
	get_node("Card2/Frames").animation = str(result2)
	card_values[1] = get_cardName(result2)
	
	var result3 = randomPicker.pick_random_item()
	get_node("Card3/Frames").animation = str(result3)
	card_values[2] = get_cardName(result3)
	
	var result4 = randomPicker.pick_random_item()
	get_node("Card4/Frames").animation = str(result4)
	card_values[3] = get_cardName(result4)
	
	var result5 = randomPicker.pick_random_item()
	get_node("Card5/Frames").animation = str(result5)
	card_values[4] = get_cardName(result5)

func _physics_process(delta):
	get_node("DevAtkDmg").set_text("Current Attack: " + str(attack))
	get_node("BossHealthBar")._set_health(bossHealth)
	
	cardsScore()
	
	if validAction:
		
		# Show valid combo as green
		if selected_cards[0]:
			get_node("Card1/Frames").modulate = Color(0, 1, 0, 1)
		if selected_cards[1]:
			get_node("Card2/Frames").modulate = Color(0, 1, 0, 1)
		if selected_cards[2]:
			get_node("Card3/Frames").modulate = Color(0, 1, 0, 1)
		if selected_cards[3]:
			get_node("Card4/Frames").modulate = Color(0, 1, 0, 1)
		if selected_cards[4]:
			get_node("Card5/Frames").modulate = Color(0, 1, 0, 1)
		
		# Main Stuff
		if Input.is_action_just_pressed("debug_r"): #spacebar
			if attack > 0:
				bossHealth -= attack
				damageSent = true
			
			if damageSent: # Selected cards unselect, redraw, move down
				if selected_cards[0]:
					var result1 = randomPicker.pick_random_item()
					get_node("Card1/Frames").animation = str(result1)
					card_values[0] = get_cardName(result1)
					get_node("Card1/Frames").position.y = 548
					get_node("Card1/Frames").modulate = Color(1, 1, 1, 1)
					selected_cards[0] = false
				
				if selected_cards[1]:
					var result2 = randomPicker.pick_random_item()
					get_node("Card2/Frames").animation = str(result2)
					card_values[1] = get_cardName(result2)
					get_node("Card2/Frames").position.y = 548
					get_node("Card2/Frames").modulate = Color(1, 1, 1, 1)
					selected_cards[1] = false
				
				if selected_cards[2]:
					var result3 = randomPicker.pick_random_item()
					get_node("Card3/Frames").animation = str(result3)
					card_values[2] = get_cardName(result3)
					get_node("Card3/Frames").position.y = 548
					get_node("Card3/Frames").modulate = Color(1, 1, 1, 1)
					selected_cards[2] = false
				
				if selected_cards[3]:
					var result4 = randomPicker.pick_random_item()
					get_node("Card4/Frames").animation = str(result4)
					card_values[3] = get_cardName(result4)
					get_node("Card4/Frames").position.y = 548
					get_node("Card4/Frames").modulate = Color(1, 1, 1, 1)
					selected_cards[3] = false
				
				if selected_cards[4]:
					var result5 = randomPicker.pick_random_item()
					get_node("Card5/Frames").animation = str(result5)
					card_values[4] = get_cardName(result5)
					get_node("Card5/Frames").position.y = 548
					get_node("Card5/Frames").modulate = Color(1, 1, 1, 1)
					selected_cards[4] = false
			else:
				var result1 = randomPicker.pick_random_item()
				get_node("Card1/Frames").animation = str(result1)
				card_values[0] = get_cardName(result1)
				
				var result2 = randomPicker.pick_random_item()
				get_node("Card2/Frames").animation = str(result2)
				card_values[1] = get_cardName(result2)
				
				var result3 = randomPicker.pick_random_item()
				get_node("Card3/Frames").animation = str(result3)
				card_values[2] = get_cardName(result3)
				
				var result4 = randomPicker.pick_random_item()
				get_node("Card4/Frames").animation = str(result4)
				card_values[3] = get_cardName(result4)
				
				var result5 = randomPicker.pick_random_item()
				get_node("Card5/Frames").animation = str(result5)
				card_values[4] = get_cardName(result5)
			
			damageSent = false
	else: # if invalid action
		
		# Show invalid action as yellow
		if selected_cards[0]:
			get_node("Card1/Frames").modulate = Color(1, 1, 0, 1)
		if selected_cards[1]:
			get_node("Card2/Frames").modulate = Color(1, 1, 0, 1)
		if selected_cards[2]:
			get_node("Card3/Frames").modulate = Color(1, 1, 0, 1)
		if selected_cards[3]:
			get_node("Card4/Frames").modulate = Color(1, 1, 0, 1)
		if selected_cards[4]:
			get_node("Card5/Frames").modulate = Color(1, 1, 0, 1)
		
		if Input.is_action_just_pressed("debug_r"): #spacebar
			if selected_cards[0]:
				get_node("Card1/Frames").position.y = 548
				get_node("Card1/Frames").modulate = Color(1, 1, 1, 1)
				selected_cards[0] = false
			var result1 = randomPicker.pick_random_item()
			get_node("Card1/Frames").animation = str(result1)
			card_values[0] = get_cardName(result1)
				
			if selected_cards[1]:
				get_node("Card2/Frames").position.y = 548
				get_node("Card2/Frames").modulate = Color(1, 1, 1, 1)
				selected_cards[1] = false
			var result2 = randomPicker.pick_random_item()
			get_node("Card2/Frames").animation = str(result2)
			card_values[1] = get_cardName(result2)
				
			if selected_cards[2]:
				get_node("Card3/Frames").position.y = 548
				get_node("Card3/Frames").modulate = Color(1, 1, 1, 1)
				selected_cards[2] = false
			var result3 = randomPicker.pick_random_item()
			get_node("Card3/Frames").animation = str(result3)
			card_values[2] = get_cardName(result3)
				
			if selected_cards[3]:
				get_node("Card4/Frames").position.y = 548
				get_node("Card4/Frames").modulate = Color(1, 1, 1, 1)
				selected_cards[3] = false
			var result4 = randomPicker.pick_random_item()
			get_node("Card4/Frames").animation = str(result4)
			card_values[3] = get_cardName(result4)
				
			if selected_cards[4]:
				get_node("Card5/Frames").position.y = 548
				get_node("Card5/Frames").modulate = Color(1, 1, 1, 1)
				selected_cards[4] = false
			var result5 = randomPicker.pick_random_item()
			get_node("Card5/Frames").animation = str(result5)
			card_values[4] = get_cardName(result5)

func get_cardValue(itemValue):
	var cardValue = 0
	match itemValue.left(1):
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
	return cardValue

func get_cardName(itemName):
	var cardName = ""
	match itemName.left(1):
		"A":
			cardName = "1"
		"2":
			cardName = "2"
		"3":
			cardName = "3"
		"4":
			cardName = "4"
		"5":
			cardName = "5"
		"6":
			cardName = "6"
		"7":
			cardName = "7"
		"8":
			cardName = "8"
		"9":
			cardName = "9"
		"1":
			cardName = "10"
		"J":
			cardName = "J"
		"Q":
			cardName = "Q"
		"K":
			cardName = "K"
	return cardName


func cardsScore():
	var selected_values: Array = []
	
	for i in card_values.size():
		if selected_cards[i]:
			selected_values.push_back(card_values[i])
	
	if selected_values.size() == 1:
		validAction = false
	if selected_values.size() == 0:
		validAction = true
	
	# 2/3/4 of a kind
	var get_duplicates = getDuplicates(selected_values)
	
	match get_duplicates:
		1:
			attack = 20
			validAction = true
		2:
			attack = 60
			validAction = true
		3:
			attack = 120
			validAction = true
		0:
			attack = 0
	
	# Sum = 21
	var current_sum = 0
	
	for value in selected_values:
		if value == "J":
			value = "10"
		if value == "Q":
			value = "10"
		if value == "K":
			value = "10"
		current_sum += int(value)
	
	if current_sum == 21:
		attack = 21
		validAction = true
	
	#DEBUG
	print("Selected values" + str(selected_values))
	print("Current sum " + str(current_sum))
	
	# 3/4/5 consecutive numbers
	if isConsecutiveSequence(selected_values, 3):
		if selected_values == ["6", "7", "8"]:
			attack = 42
			validAction = true
		attack = current_sum
		validAction = true
	if isConsecutiveSequence(selected_values, 4):
		attack = current_sum
		validAction = true
	if isConsecutiveSequence(selected_values, 5):
		attack = current_sum
		validAction = true

func getDuplicates(array_to_check: Array) -> int:
	var duplicate_count = 0
	var seen_numbers = {}
	
	for number in array_to_check:
		if seen_numbers.has(number) and areAllValuesSame(array_to_check):
			duplicate_count += 1
		else:
			seen_numbers[number] = true
			validAction = false
	
	return duplicate_count

func areAllValuesSame(array_to_check: Array) -> bool:
	if array_to_check.size() <= 1:
		return true
	
	var first_value = array_to_check[0]
	
	for i in range(1, array_to_check.size()):
		if array_to_check[i] != first_value:
			return false
	
	return true

func isConsecutiveSequence(array_to_check: Array, consecutive_length: int) -> bool:
	var card_dict = {
		"1": 1,
		"2": 2,
		"3": 3,
		"4": 4,
		"5": 5,
		"6": 6,
		"7": 7,
		"8": 8,
		"9": 9,
		"10": 10,
		"J": 11,
		"Q": 12,
		"K": 13
	}
	var numeric_values = []
	for value in array_to_check:
		numeric_values.append(card_dict[value])
	
	numeric_values.sort()
	print(numeric_values)
	
	var consecutive_count = 1
	for i in range(1, numeric_values.size()):
		if numeric_values[i] - numeric_values[i - 1] == 1:
			consecutive_count += 1
			if consecutive_count >= consecutive_length:
				return true
		else:
			consecutive_count = 1
	
	return false

# Cards enter "selected_cards" array and move up/down when clicked
func _on_card_1_button_pressed():
	if !selected_cards[0]:
		selected_cards[0] = true
		get_node("Card1/Frames").position.y = 528
	else:
		selected_cards[0] = false
		get_node("Card1/Frames").position.y = 548

func _on_card_2_button_pressed():
	if !selected_cards[1]:
		selected_cards[1] = true
		get_node("Card2/Frames").position.y = 528
	else:
		selected_cards[1] = false
		get_node("Card2/Frames").position.y = 548

func _on_card_3_button_pressed():
	if !selected_cards[2]:
		selected_cards[2] = true
		get_node("Card3/Frames").position.y = 528
	else:
		selected_cards[2] = false
		get_node("Card3/Frames").position.y = 548

func _on_card_4_button_pressed():
	if !selected_cards[3]:
		selected_cards[3] = true
		get_node("Card4/Frames").position.y = 528
	else:
		selected_cards[3] = false
		get_node("Card4/Frames").position.y = 548

func _on_card_5_button_pressed():
	if !selected_cards[4]:
		selected_cards[4] = true
		get_node("Card5/Frames").position.y = 528
	else:
		selected_cards[4] = false
		get_node("Card5/Frames").position.y = 548

# Cards get gray tint when mouse hovers over them
func _on_card_1_button_mouse_entered():
	get_node("Card1/Frames").modulate = Color(0.8, 0.8, 0.8, 1)

func _on_card_1_button_mouse_exited():
	get_node("Card1/Frames").modulate = Color(1, 1, 1, 1)

func _on_card_2_button_mouse_entered():
	get_node("Card2/Frames").modulate = Color(0.8, 0.8, 0.8, 1)

func _on_card_2_button_mouse_exited():
	get_node("Card2/Frames").modulate = Color(1, 1, 1, 1)

func _on_card_3_button_mouse_entered():
	get_node("Card3/Frames").modulate = Color(0.8, 0.8, 0.8, 1)

func _on_card_3_button_mouse_exited():
	get_node("Card3/Frames").modulate = Color(1, 1, 1, 1)

func _on_card_4_button_mouse_entered():
	get_node("Card4/Frames").modulate = Color(0.8, 0.8, 0.8, 1)

func _on_card_4_button_mouse_exited():
	get_node("Card4/Frames").modulate = Color(1, 1, 1, 1)

func _on_card_5_button_mouse_entered():
	get_node("Card5/Frames").modulate = Color(0.8, 0.8, 0.8, 1)

func _on_card_5_button_mouse_exited():
	get_node("Card5/Frames").modulate = Color(1, 1, 1, 1)
