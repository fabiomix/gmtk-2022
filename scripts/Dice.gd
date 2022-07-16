extends Control


# Declare member variables here.
var value = false


# Called to set the dice value and change the Sprite.
func set_value(new_value):
	value = new_value
	$Label.text = str(new_value)
