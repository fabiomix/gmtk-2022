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
