extends CharacterBody2D


const SPEED = 130.0
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

func _ready() -> void:
	dialog.visible = true
	dialog.text = "Ugh..."
	dialog.modulate = Color.DARK_SLATE_GRAY

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

func _on_fridge_body_entered(body: Node2D) -> void:
	player_state = PlayerState.InFridge
	dialog.visible = true
	dialog.add_theme_font_size_override("font_size", 12)
	dialog.text = "...Nothing but a half-eaten apple..."


func _on_fridge_body_exited(body: Node2D) -> void:
	player_state = PlayerState.Moving
	dialog.visible = false
