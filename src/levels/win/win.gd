extends Node

const jiggle = 20
var w_jigs = 15
var i_jigs = 10
var n_jigs = 5
var w_jiggle = Vector2.UP
var i_jiggle = Vector2.UP
var n_jiggle = Vector2.UP
var flip = false

func _process(delta):
	flip = !flip
	if not flip:
		return
	
	w_jigs += 1
	$Label.position += w_jiggle
	if w_jigs == jiggle:
		w_jigs = 0
		w_jiggle *= -1
		
	i_jigs += 1
	$Label2.position += i_jiggle
	if i_jigs == jiggle:
		i_jigs = 0
		i_jiggle *= -1
		
	n_jigs += 1
	$Label3.position += n_jiggle
	if n_jigs == jiggle:
		n_jigs = 0
		n_jiggle *= -1
		


func _on_timer_timeout():
	get_tree().quit()
