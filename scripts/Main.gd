extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var node = false
	randomize()
	for x in range(1, 6):
		node = get_node("Dice" + str(x))
		node.set_value((randi() % 6) + 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
