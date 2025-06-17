class_name ItemData
extends Resource
# Human, You're Not Reading My Trello >:(
## AKA
## The name of the item
@export var item_name : String = "Pls send helpi X3"
## material_ids (I've put 100 id slots for materials, probably more than enough)
## MATERIALS HAVE THE SAME ID IN ALL ID SLOTS aka 
## (material1_id = 10, material2_id = 10, material3_id = 10, item_id = 10).
## IF AN ITEM ONLY HAS ONE MATERIAL, ALL MATERIAL ID SLOTS HAVE THE SAME ID
## OR SET UNUSED SLOTS TO 0.
## IF AN ITEM HAS TWO MATERIAL SLOTS, THE THIRD SLOT IS 0.
## We have now mutliple slots for ids (very useful for crafting)
## A MATERIAL WITH MULTIPLE DIFFERENT MATERIAL IDS MAY NOT BE USED FOR CRAFTING
## Due to crafting slots only having 1 slot for now;
## In the future, you wil be able to uncraft stuff... MAYBE X3
@export_range(0, 99) var material1_id : int = 000
## material_ids (I've put 100 id slots for materials, probably more than enough)
## MATERIALS HAVE THE SAME ID IN ALL ID SLOTS aka 
## (material1_id = 10, material2_id = 10, material3_id = 10, item_id = 10)
## IF AN ITEM ONLY HAS ONE MATERIAL, ALL MATERIAL ID SLOTS HAVE THE SAME ID
## OR SET UNUSED SLOTS TO 0.
## IF AN ITEM HAS TWO MATERIAL SLOTS, THE THIRD SLOT IS 0
## We have now mutliple slots for ids (very useful for crafting)
## A MATERIAL WITH MULTIPLE DIFFERENT MATERIAL IDS MAY NOT BE USED FOR CRAFTING
## Due to crafting slots only having 1 slot for now;
## In the future, you wil be able to uncraft stuff... MAYBE X3
@export_range(0, 99) var material2_id : int = 000
## material_ids (I've put 100 id slots for materials, probably more than enough)
## MATERIALS HAVE THE SAME ID IN ALL ID SLOTS aka 
## (material1_id = 10, material2_id = 10, material3_id = 10, item_id = 10)
## IF AN ITEM ONLY HAS ONE MATERIAL, ALL MATERIAL ID SLOTS HAVE THE SAME ID
## OR SET UNUSED SLOTS TO 0.
## IF AN ITEM HAS TWO MATERIAL SLOTS, THE THIRD SLOT IS 0
## We have now mutliple slots for ids (very useful for crafting)
## A MATERIAL WITH MULTIPLE DIFFERENT MATERIAL IDS MAY NOT BE USED FOR CRAFTING
## Due to crafting slots only having 1 slot for now;
## In the future, you wil be able to uncraft stuff... MAYBE X3
@export_range(0, 99) var material3_id : int = 000
## id of itens (starts at 100 so that you use for others items)
@export_range(0, 999) var item_id : int = 100
## state of item(0 -> broken, 5 -> normal, 9-> perfect)
@export var item_state : int = 5
## shaprness of item (0-> blunt or not utilized, 9->sharp, 20-> razor sharp, 99->atomic sharp)
@export var item_sharpness : int = 0
## Temperature of items is in kelvins K.
## The Sun surface temperature is about 6000K
@export var item_base_temperature : int = 300
## Temperature in which the items melt in kelvins K.
## The Sun surface temperature is about 6000K
@export var item_melting_temperature : int = 600
## Temperature in which the items vaporize in kelvins K.
## The Sun surface temperature is about 6000K
@export var item_vaporization_temperature : int = 900
## If item is static, Texture2D is not null
@export var item_texture : Texture2D = null
## If item is animated, SpriteFrames is not null
@export var item_frames : SpriteFrames = null
## JOAO THIS IS USED TO LIMIT ITEM STACKS,
## WITHOUT THIS INFORMATION THE GAME WILL STACK AN INFITE
## NUMBER OF ITEMS XD
@export_range(0, 999) var item_stack_size : int = 1
## Add audio to play sound when pickup
@export var item_pickup_sound : AudioStream = null
## Add audio to play sound when drop
@export var item_drop_sound : AudioStream = null
