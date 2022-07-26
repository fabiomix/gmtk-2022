extends Control


# Declare member variables here.
var operator = false


func _on_Button1_pressed():
	operator = '+'

func _on_Button2_pressed():
	operator = '-'

func _on_Button3_pressed():
	operator = '*'

func _on_Button4_pressed():
	operator = '/'

func reset_button():
	$Button1.pressed = false
	$Button2.pressed = false
	$Button3.pressed = false
	$Button4.pressed = false
	operator = false

# Set the next operator as active
func loop_button():
	var next_button = false
	if $Button1.pressed:
		next_button = $Button2
	elif $Button2.pressed:
		next_button = $Button3
	elif $Button3.pressed:
		next_button = $Button4
	elif $Button4.pressed:
		next_button = $Button1
	else:
		next_button = $Button1
	next_button.emit_signal("pressed")
	next_button.set_pressed(true)
