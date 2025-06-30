extends Button

@onready var buttON: Button = $"."

func _ready() -> void:
	# Management said I can't give cat the salmon smh...
	# It will have to do with GENERIC BRAND fish instead...
	buttON.text = "CRAFT"
