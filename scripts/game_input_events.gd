class_name GameInputEvents

static var direction: Vector2
static var runTime: bool = false
static var slowTime: bool = false

static func movement_input() -> Vector2:
	direction = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	#if Input.is_action_pressed("walk_left"):
		#direction = Vector2.LEFT
	#elif Input.is_action_pressed("walk_right"):
		#direction = Vector2.RIGHT
	#elif Input.is_action_pressed("walk_up"):
		#direction = Vector2.UP
	#elif Input.is_action_pressed("walk_down"):
		#direction = Vector2.DOWN
	#else:
		#direction = Vector2.ZERO
	
	return direction

## Aqui checa-se se o jogador quer correr
static func run() -> bool:
	if Input.is_action_just_pressed("run"):
		runTime = not runTime
	
	return runTime
	
## Aqui checa-se se o jogador quer andar lento, mais preciso
static func walk_slow() -> bool:
	if Input.is_action_just_pressed("slow_walk"):
		slowTime = not slowTime
	
	return slowTime

static func is_movement_input() -> bool:
	if direction == Vector2.ZERO:
		return false
	else:
		return true

static func use_tool() -> bool:
	#var use_tool_value : bool = Input.is_action_just_pressed("hit")
	var use_tool_value : bool = Input.is_action_pressed("hit")
	
	return use_tool_value
