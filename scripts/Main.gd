extends Node2D


# Declare member variables here.
var DICE_SIDES = 6
var DICE_RENDERED = 5
var OPERATOR_RENDERED = DICE_RENDERED - 1
var MATH_OPERATORS = ['+', '-', '*', '/']

var player_score = 0
var target_score = 21


# Called when the node enters the scene tree for the first time.
func _ready():
	var tmp_node = false
	randomize()
	for x in range(1, DICE_RENDERED+1):
		tmp_node = get_node("Dice" + str(x))
		tmp_node.set_value((randi() % DICE_SIDES) + 1)
	#test_player_score()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# Return the player score
func get_player_score():
	var tmp_node = false
	for x in range(1, OPERATOR_RENDERED+1):
		tmp_node = get_node("MathButtons" + str(x))
		if not MATH_OPERATORS.has(tmp_node.operator):
			return 0
	var expression = Expression.new()
	var math_problem = ''
	math_problem += str($Dice1.value)
	math_problem += $MathButtons1.operator
	math_problem += str($Dice2.value)
	math_problem += $MathButtons2.operator
	math_problem += str($Dice3.value)
	math_problem += $MathButtons3.operator
	math_problem += str($Dice4.value)
	math_problem += $MathButtons4.operator
	math_problem += str($Dice5.value)
	expression.parse(math_problem)
	var result = expression.execute()
	return result


# [DEBUG] sum all dice and echo the total in console
func test_player_score():
	var tmp_node = false
	for x in range(1, OPERATOR_RENDERED+1):
		tmp_node = get_node("MathButtons" + str(x))
		tmp_node._on_Button1_pressed()
	player_score = get_player_score()
	print(player_score)
