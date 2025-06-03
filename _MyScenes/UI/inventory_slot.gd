class_name InventorySlot
extends Panel

@onready var item_texture_slot: TextureRect = %ItemTextureSlot
@onready var stack_label : Label = %StackLabel

var item_data : ItemData = null

func set_item_data(new_item : ItemData, stack_size : int) -> void:
	item_data = new_item
	if item_data.item_frames != null:
		item_texture_slot.texture = item_data.item_frames.get_frame_texture("default", 0)
	elif item_data.item_texture != null:
		item_texture_slot.texture = item_data.item_texture
	else:
		print("You forgotti about texturitti, OOPSIE XP")
	set_current_stack_size(stack_size)

func set_current_stack_size(stack : int) -> void:
	if stack > 1 :
		stack_label.show()
		# Uses a python ternary operation to decide if it prints max_stack_size or 0 as error;
		# Python ternary == TRUE if (COND) else FALSE;
		stack_label.text = str(stack) + "/" + str(item_data.item_stack_size if item_data != null else 0)
	else:
		stack_label.hide()
		return
