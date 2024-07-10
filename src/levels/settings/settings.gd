extends Node

func _on_option_button_item_selected(index):
	var text = $GridContainer/OptionButton.get_item_text(index)
	if text == "Full Screen":
		get_window().mode = Window.MODE_FULLSCREEN
	elif text == "Windowed":
		get_window().mode = Window.MODE_MAXIMIZED


func _on_button_pressed():
	get_tree().change_scene_to_file("res://levels/menu/menu.tscn")
