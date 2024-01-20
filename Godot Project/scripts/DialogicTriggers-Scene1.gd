extends Control

func _ready():
	Dialogic.start("test")
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _process(delta):
	pass

func _on_dialogic_signal(argument:String):
	if argument == "test_finished":
		get_parent().get_node("ShopMenu").show()
