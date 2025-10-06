extends CharacterBody2D
class_name Player

const SPEED = 400.0
const JUMP_VELOCITY = 0.0

#signal player_state_changed(state)
@onready var camera_2d: Camera2D = $Camera2D
@onready var dialog: Label = $Dialog

@export var min_zoom : float = 4.0
@export var max_zoom : float = 8.0

#this is where i pasted movement code
@onready var _animated_sprite = $AnimatedSprite2D
@onready var umbrella: AnimatedSprite2D = $umbrella

func _ready() -> void:
	if Global.current_scene_name == Global.SceneName.InDoor:
		camera_2d.limit_right = 2200
	elif Global.current_scene_name == Global.SceneName.Busstop:
		camera_2d.limit_right = 300

func _process(_delta):
	if Input.is_action_pressed("movement") and Global.is_umbrella_pick_up==false:
		_animated_sprite.play("run")
			
	elif Input.is_action_pressed("movement") and Global.is_umbrella_pick_up == true and Global.current_scene_name ==Global.SceneName.InDoor:
		_animated_sprite.visible=false
		umbrella.visible = true
		umbrella.play("closed")
		_animated_sprite.play("run")
		
	elif Global.is_umbrella_pick_up == true and Global.current_scene_name ==Global.SceneName.InDoor and not Input.is_action_pressed("movement"):
			umbrella.stop()
	
	elif Global.current_scene_name == Global.SceneName.Busstop and Global.is_umbrella_pick_up == true:
		_animated_sprite.visible=false
		umbrella.visible = true
		if Input.is_action_pressed("movement"):
			umbrella.play("default")
		else: 
			umbrella.stop()
	else:
		_animated_sprite.stop()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction !=0:
		velocity.x = direction * SPEED
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
			$umbrella.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
			$umbrella.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("+"):
			camera_2d.zoom = Vector2(max_zoom, max_zoom)
		elif event.is_action_pressed("-"):
			camera_2d.zoom = Vector2(min_zoom, min_zoom)
