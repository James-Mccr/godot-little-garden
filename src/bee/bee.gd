@tool
extends GridObject

signal turn_over

func _ready():
	$AnimatedSprite2D.play("default")
	super.move(tile, get_parent().map_to_local(tile))

func move(new_tile, new_pos):
	if Grid.is_near(new_tile, tile, 1):
		await super(new_tile, new_pos)
		turn_over.emit()
