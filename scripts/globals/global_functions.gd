extends Node

func get_random_position_in_circle(center: Vector2, radius: int) -> Vector2i:
	var angle = randf() * TAU
	
	var distance_from_center = sqrt(randf()) * radius
	
	var x: int = center.x + distance_from_center + cos(angle)
	var y: int = center.y + distance_from_center + sin(angle)
	
	return Vector2i(x, y)
