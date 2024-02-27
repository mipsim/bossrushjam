extends Node
class_name RandomPicker

@export var items_list: Array = []

func pick_random_item(items_array: Array = items_list):
	var chosen_value = null
	# 1. Calculate the overall chance
	var overall_chance: int = 0
	for item in items_list:
		if item.can_be_picked:
			overall_chance += item.PICK_CHANCE
		
	# 2. Generate a random number
	var random_number
	if overall_chance == 0:
		chosen_value = "Empty"
	else:
		random_number = randi() % overall_chance
		
		# 3. Pick a random item
		var offset: int = 0
		for item in items_array:
			if item.can_be_picked:
				if random_number < item.PICK_CHANCE + offset:
					chosen_value = item.VALUE
					item.set_pickable(false)
					break
				else:
					offset += item.PICK_CHANCE
		pass
	
	# 4. Count how many pickable items remain
	var count_pickables = 0
	
	for item in items_array:
		if item.can_be_picked:
			count_pickables += 1
	
	# 5. Reshuffle deck if the next hand have less than 5 cards
	if count_pickables <= 5:
		for item in items_array:
			item.set_pickable(true)
	
	# 4. Return the value
	return chosen_value
