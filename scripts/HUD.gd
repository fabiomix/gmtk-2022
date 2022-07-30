extends Control


# Define events.
signal start_new_game
signal check_player_score


# Reset HUD for a new game.
func init_new_game():
	set_target_score('-')
	set_player_score('-')
	$SoundNewGame.play()


# Proxy for Main scene to set target score.
func set_target_score(new_value):
	$LabelTargetScoreValue.text = str(new_value)


# Proxy for Main scene to set player score.
func set_player_score(new_value):
	if new_value == null:
		new_value = '-'
	$LabelPlayerScoreValue.text = str(new_value)


# Update HUD on solution found.
func show_success():
	$SoundSuccess.play()


# Update HUD on wrong solution.
func show_fail():
	pass


# Notify main scene to initialize new game.
func _on_ButtonNewGame_pressed():
	emit_signal("start_new_game")


# Notify main scene to check the score.
func _on_ButtonCheck_pressed():
	emit_signal("check_player_score")
