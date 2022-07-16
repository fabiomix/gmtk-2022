extends Control


# Define event.
signal start_new_game


# Notify main scene to initialize new game.
func _on_ButtonNewGame_pressed():
	emit_signal("start_new_game")
