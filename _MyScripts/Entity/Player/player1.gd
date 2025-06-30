class_name PlayerEntity
extends CharacterBody2D
@onready var sprite_2d: Sprite2D = $Corpo
@onready var front: RayCast2D = $Front
var baseFront : Vector2

## How fast is the character when walking
@export var BaseVelocidade = 250
var velocidade = 250
## How much should the speed be boosted if the character is
## Sprinting
@export var Fast = 2.0
## How much should the speed be decreased if the character is
## Crouching
@export var Slow = 0.5
var runTime = false
var slowTime = false
@export var distanciaDoObjeto = 16

var inventory_component : InventoryComponent = InventoryComponent.new()

## Used to determine how many inventory slots
## the character should possess
@export var max_slots_for_inventory : int = 1

signal interact_with_object;

func _ready() -> void:
	velocidade = BaseVelocidade
	inventory_component.max_inventory_slots = max_slots_for_inventory

func detec_interact():
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("interact_with_object")
		interact_with_object.emit()

func detec_input():
	#if Input.get_axis()
	# Aqui obtém-se a direção que o jogador quer andar
	# Que pode ser (-1,0)[esquerda], (1,0)[direita],
	# (0,-1)[cima], (1,0)[baixo], (-1,-1)[esquerda e cima],
	# (1,-1)[direita e cima], (-1,1)[esquerda e baixo],
	# (1,1)[direita e baixo], 
	var direcao = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	front.target_position = direcao * distanciaDoObjeto
	# Aqui checa-se se o jogador quer correr
	# print("(" + str(direcao.x) + ", " + str(direcao.y) + ")")
	if Input.is_action_just_pressed("ui_quick"):
		runTime = not runTime
	# Aqui checa-se se o jogador quer andar lento, mais preciso
	if Input.is_action_just_pressed("ui_slow"):
		slowTime = not slowTime
	if direcao.x > 0:
		sprite_2d.flip_h = true;
	else:
		sprite_2d.flip_h = false;
		
	# Aqui checa-se se o jogador deve andar rápido, lento ou normal
	if runTime and (not slowTime):
		velocidade = BaseVelocidade * Fast
	elif slowTime and (not runTime):
		velocidade = BaseVelocidade * Slow	
	else:
		velocidade = BaseVelocidade
	
	#var direcao = Input.
	velocity = direcao.normalized() * velocidade
	
func _physics_process(_delta):
	detec_input()
	detec_interact()
	move_and_slide()
	
