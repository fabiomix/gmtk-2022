extends Node2D


# Declare member variables here.
var DICE_SIDES = 6
var DICE_RENDERED = 5
var OPERATOR_RENDERED = DICE_RENDERED - 1
var MATH_OPERATORS = ['+', '-', '*', '/']

var player_score = 0
var target_score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	var tmp_node = false
	randomize()
	for x in range(1, DICE_RENDERED+1):
		tmp_node = get_node("Dice" + str(x))
		tmp_node.set_value((randi() % DICE_SIDES) + 1)
	set_target_score()
	#test_player_score()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# Return the player score, reading the user-selected operators.
func get_player_score():
	var operators = []
	var tmp_node = false
	for x in range(1, OPERATOR_RENDERED+1):
		tmp_node = get_node("MathButtons" + str(x))
		operators.append(tmp_node.operator)
	print("get_player_score")
	var result = compute_points(operators[0], operators[1], operators[2], operators[3])
	return result


# Given the dice values, generate the problem by randomizing the operators.
# After that, compute the target score. User now needs to guess the random operators...
func set_target_score():
	var operators = []
	for x in range(1, OPERATOR_RENDERED+1):
		operators.append(MATH_OPERATORS[randi() % MATH_OPERATORS.size()])
	print("set_target_score")
	target_score = compute_points(operators[0], operators[1], operators[2], operators[3])


# Compose the math expression and eval its result.
# Dice values are static and always get from scene.
# Operators are passed as string args, so we can use this
# for computing both the game problem and the user solution.
func compute_points(op1, op2, op3, op4):
	for x in [op1, op2, op3, op4]:
		if not MATH_OPERATORS.has(x):
			return 0
	var expression = Expression.new()
	var math_problem = ''
	math_problem += str($Dice1.value)
	math_problem += op1
	math_problem += str($Dice2.value)
	math_problem += op2
	math_problem += str($Dice3.value)
	math_problem += op3
	math_problem += str($Dice4.value)
	math_problem += op4
	math_problem += str($Dice5.value)
	expression.parse(math_problem)
	var result = expression.execute()
	print(math_problem + ' = ' + str(result))
	return result


# [DEBUG] sum all dice and echo the total in console
func test_player_score():
	var tmp_node = false
	for x in range(1, OPERATOR_RENDERED+1):
		tmp_node = get_node("MathButtons" + str(x))
		tmp_node._on_Button1_pressed()
	player_score = get_player_score()
