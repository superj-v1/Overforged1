extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
## How fast is the character when walking
@export var speed: int = 50

## How much should the speed be boosted if the character is
## Sprinting
var Fast = 2.0
## How much should the speed be decreased if the character is
## Crouching
var Slow = 0.5
var runTime: bool
var slowTime: bool
enum Directions
{
	None,
	Up,
	Right,
	Left,
	Down
}

var previous_direction

func _unhandled_input(event: InputEvent) -> void:
	runTime = GameInputEvents.run()
	slowTime = GameInputEvents.walk_slow()

func _on_process(_delta : float) -> void:
	pass

func direction_checker(Directions : int, previous_direction : int) -> bool:
	 #&& direction_checker(Directions.Up, previous_direction)
	#match(Directions):
		#0:
			#return true
		#1:
			#if previous_direction
		#2:
		#3:
		#4:
		#_:
			#print("ERROR Direction input not whithin bounds in direction_checker")
		
	return true

func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	if direction == Vector2.UP:
		previous_direction = Directions.Up
		animated_sprite_2d.play("walk_back")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walk_front")
	
	if direction != Vector2.ZERO:
		player.player_direction = direction
		
		# Aqui checa-se se o jogador deve andar rápido, lento ou normal
	if runTime and (not slowTime):
		player.velocity = speed * Fast * direction
	elif slowTime and (not runTime):
		player.velocity = speed * Slow * direction
	else:
		player.velocity = direction * speed
	
	#player.velocity = direction * speed
	player.move_and_slide()


func _on_next_transitions() -> void:
	if GameInputEvents.use_tool():
		if player.current_tool == DataTypes.Tools.AxeWood:
			transition.emit("Chopping")
		if player.current_tool == DataTypes.Tools.TillGround:
			transition.emit("Tilling")
		if player.current_tool == DataTypes.Tools.WaterCrops:
			transition.emit("Watering")
	
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	animated_sprite_2d.stop()
