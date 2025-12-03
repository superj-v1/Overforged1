extends Timer

@export var audio_stream_stream_player_2d: AudioStreamPlayer2D
@export var wait_time_min: float = 2.0
@export var wait_time_max: float = 10.0
@export var pítch_scale_min: float = 0.7
@export var pítch_scale_max: float = 1.6
@onready var audio_play_time_component: Timer = $"."

func _ready() -> void:
	audio_play_time_component.wait_time = randf_range(wait_time_min, wait_time_max)

func _on_timeout() -> void:
	audio_stream_stream_player_2d.pitch_scale = randf_range(pítch_scale_min, pítch_scale_max)
	audio_stream_stream_player_2d.play()
