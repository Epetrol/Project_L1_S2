extends CharacterBody2D

@export var move_speed : float = 100
@export var starting_direction = Vector2(0,1)
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
var input_direction

func _ready() -> void:
	animation_tree.set("parameters/Idle/blend_position", starting_direction)
	
	
func _physics_process(_delta: float) -> void:
	input_direction = Vector2(Input.get_vector("left","right","up", "down"))
	
	velocity = input_direction * move_speed
	if velocity.length() > 1:
		velocity = velocity.normalized()*move_speed
	
	move_and_slide()
	update_anim_parameters(input_direction)
	update_state()
	
	
func update_anim_parameters(move_input : Vector2):
	if move_input != Vector2.ZERO:
		animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)

func update_state():
	if velocity != Vector2.ZERO:
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
	
