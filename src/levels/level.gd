extends Node
class_name Level

func _ready():
	Signals.connect("level_won", next_level)
	Signals.connect("game_over", gameover)
	$Map/Bee.connect("turn_over", $TurnManager.game_turn)

func gameover():
	pass

func next_level():
	pass

func load_level(path:String):
	$TurnManager.active = false
	get_tree().change_scene_to_file(path)
