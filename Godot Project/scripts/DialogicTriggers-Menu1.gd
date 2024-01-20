extends Control

func _ready():
	pass

func _process(delta):
	pass

func _on_texture_button_mouse_entered():
	Dialogic.start("item1_convo")


func _on_texture_button_2_mouse_entered():
	Dialogic.start("item2_convo")


func _on_texture_button_3_mouse_entered():
	Dialogic.start("item3_convo")


func _on_texture_button_4_mouse_entered():
	Dialogic.start("item4_convo")
