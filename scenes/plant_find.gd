extends Area2D
@onready var hovering_object : bool = false
@onready var zoom_in_5: Sprite2D = $"../../CanvasLayer/ZoomIn5"
@onready var magic: AudioStreamPlayer = $"../../magic"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var plant_found : bool = false
signal plantfound
@onready var plant: AnimatedSprite2D = $"../../Interactive/Plant Area/Plant/Plant"


var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true
	elif Global.is_magnifier_pick_up and Global.focus_on==true:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true
		
func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false
	elif Global.is_magnifier_pick_up and plant_found==true:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false

@export_multiline var message_text : String = ""

func _input(event: InputEvent) -> void:
	if Global.is_magnifier_pick_up and event.is_action_pressed("left_click") and hovering_object and Global.focus_on == true:
		Global.update_dialog_text.emit(message_text)
		zoom_in_5.visible=true
		magic.play()
		plant_found=true
		plantfound.emit()
		plant.play("color")
		
	elif event.is_action_pressed("left_click") and hovering_object and plant_found==true:
		Global.update_dialog_text.emit(message_text)
		zoom_in_5.visible=true
		magic.play()
