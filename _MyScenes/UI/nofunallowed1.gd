extends Button

@onready var craft_buttON: Button = $"."
#@onready var title_label: Label = %TitleLabel
#@onready var item_craft_texture_ui: TextureRect = %ItemCraftTextureUI
#@onready var item_description_label: Label = %ItemDescriptionLabel


func _ready() -> void:
	# Management said I can't give cat the salmon smh...
	# It will have to do with THAT BRAND fish instead...
	craft_buttON.text = "CRAFT"
	#title_label.text = "ITEM TO CRAFT"
	#item_craft_texture_ui.texture = null
	#item_description_label.text = "ITEM DESCRIPTION"
