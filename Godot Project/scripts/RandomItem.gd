extends Resource
class_name RandomItem

@export var VALUE:String

@export var PICK_CHANCE: int = 1
@export var can_be_picked: bool = true

func set_pickable(status):
	can_be_picked = status
