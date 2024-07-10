extends Node

func _on_start_mouse_entered():
	var start_button = $CenterContainer/VBoxContainer/start
	var height_offset = start_button.size.y/2 + 8
	$CenterContainer/VBoxContainer/AnimatedSprite2D.position = start_button.position+Vector2(0,height_offset)


func _on_settings_mouse_entered():
	var button = $CenterContainer/VBoxContainer/settings
	var height_offset = button.size.y/2 + 8
	$CenterContainer/VBoxContainer/AnimatedSprite2D.position = button.position+Vector2(0,height_offset)


func _on_quit_mouse_entered():
	var button = $CenterContainer/VBoxContainer/quit
	var height_offset = button.size.y/2 + 8
	$CenterContainer/VBoxContainer/AnimatedSprite2D.position = button.position+Vector2(0,height_offset)


func _on_start_pressed():
	get_tree().change_scene_to_file("res://levels/level0/level0.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://levels/settings/settings.tscn")
