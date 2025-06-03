extends AnimatedSprite2D
@onready var timer: Timer = $Timer as Timer

@onready var isItTrue = false

@onready var pos_before
@onready var pos_after

func _ready() -> void:
	pos_before = position.y
	pos_after = position.y - 28
	timer.start()

#func _countsTime(delta: float) -> bool:
	#if()
	#return false


func _process(delta: float) -> void:
	#isItTrue = _countsTime(delta)
	#print(isItTrue)
	if (isItTrue):
		position.y = move_toward(position.y, pos_after, delta * 2)
	else:
		position.y = move_toward(position.y, pos_before, delta * 32)
	pass


func _on_timer_timeout() -> void:
	isItTrue = not isItTrue
	timer.start()
