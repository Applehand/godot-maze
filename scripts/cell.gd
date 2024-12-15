extends Node2D
class_name Cell

var height: float = 100.0
var width: float = 100.0
var color: Color = Color("WHITE")
var wall_color: Color = Color("BLACK")

var current: bool
var chosen: bool
var visited: bool
var start: bool
var goal: bool

var walls: Array[bool] = [true, true, true, true] # left, top, right, bottom

func _draw() -> void:
	# Set the fill color based on the cell state
	if start:
		color = Color("GREEN")
	elif goal:
		color = Color("GOLD")
	elif current:
		color = Color("BLUE")
	elif chosen:
		color = Color("YELLOW")
	elif visited:
		color = Color("GRAY")

	# draw cell background
	draw_rect(Rect2(Vector2(0, 0), Vector2(width, height)), color, true)

	var wall_coords: Array = [
		[Vector2(0, 0), Vector2(0, height)], # left
		[Vector2(0, 0), Vector2(width, 0)], # top
		[Vector2(width, 0), Vector2(width, height)], # right
		[Vector2(0, height), Vector2(width, height)] # bottom
	]

	# Draw walls
	for i in range(4):
		if walls[i]:
			draw_line(wall_coords[i][0], wall_coords[i][1], wall_color, 2)

func reset_state() -> void:
	current = false
	chosen = false
	visited = false
	start = false
	goal = false
	walls = [true, true, true, true]
