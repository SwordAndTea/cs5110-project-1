extends CharacterBody2D
class_name Player

const SPEED = 400.0
const JUMP_VELOCITY = 0.0

enum PlayerState {
	Moving,
	InBed,
	InWindow,
	InDesk,
	InToaster,
	InFridge,
	InPlant,
}

var player_state := PlayerState.InBed

#signal player_state_changed(state)
@onready var camera_2d: Camera2D = $Camera2D
@onready var dialog: Label = $Dialog

@export var min_zoom : float = 4.0
@export var max_zoom : float = 8.0

#this is where i pasted movement code
@onready var _animated_sprite = $AnimatedSprite2D

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.play("run")
	else:
		_animated_sprite.stop()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction !=0:
		velocity.x = direction * SPEED
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		# handle dialog
		if player_state == PlayerState.InBed and dialog.visible:
			dialog.visible = false
			player_state = PlayerState.Moving
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("+"):
			camera_2d.zoom = Vector2(max_zoom, max_zoom)
		elif event.is_action_pressed("-"):
			camera_2d.zoom = Vector2(min_zoom, min_zoom)
