extends Control


# Declare member variables here.
var value = false


# Called to set the dice value and change the Sprite.
func set_value(new_value):
	value = new_value
	$Label.text = str(new_value)
	$Sprite.set_texture(load("res://images/dice_" + str(new_value) + ".png"))
