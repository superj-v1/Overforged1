extends Control

@onready var day_label: Label = $DayPanel/MarginContainer/DayLabel

@onready var time_label: Label = $TimePanel/MarginContainer/TimeLabel

@export var normal_speed: float = 5.0
@export var fast_speed: float = 100.0
@export var ludicrous_speed: float = 200.0

@export var pause_speed: float = 0.0

@export var rewind_speed: float = -5.0
@export var return_speed: float = -100.0
@export var backtothepast_speed: float = -200.0

func _ready() -> void:
	DayAndNightCycleManager.time_tick.connect(on_time_tick)
	

func on_time_tick(day: int, hour: int, minute: int) -> void:
	day_label.text = "Day " + str(day)
	# %02d = Converts int to string
	time_label.text = "%02d:%02d" % [hour, minute]
	

# Game speed button modifiers are connected here
func _on_normal_speed_button_pressed() -> void:
	DayAndNightCycleManager.game_speed = normal_speed

func _on_fast_speed_button_pressed() -> void:
	DayAndNightCycleManager.game_speed = fast_speed

func _on_ludicrous_speed_button_pressed() -> void:
	DayAndNightCycleManager.game_speed = ludicrous_speed

func _on_rewind_speed_button_pressed() -> void:
	DayAndNightCycleManager.game_speed = rewind_speed

func _on_return_speed_button_pressed() -> void:
	DayAndNightCycleManager.game_speed = return_speed

func _on_back_to_the_past_speed_button_pressed() -> void:
	DayAndNightCycleManager.game_speed = backtothepast_speed

func _on_pause_button_pressed() -> void:
	DayAndNightCycleManager.game_speed = pause_speed
