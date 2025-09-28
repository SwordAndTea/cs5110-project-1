extends Area2D
@onready var hovering_object : bool = false
@onready var zoom_in_2: Sprite2D = $"../../CanvasLayer/ZoomIn2"
@onready var fridge_anim: AnimatedSprite2D = $"../../Interactive/Fridge Area/Fridge/FridgeAnim"
@onready var magic: AudioStreamPlayer = $"../../magic"
@onready var fridge_find: Sprite2D = $"CollisionShape2D/fridge find"
@onready var fridge_found : bool = false

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true
	elif Global.is_magnifier_pick_up and fridge_found==true:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true
		
func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false
	elif Global.is_magnifier_pick_up and fridge_found==true:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false

@export_multiline var message_text : String = ""

func _input(event: InputEvent) -> void:
	if Global.is_magnifier_pick_up and event.is_action_pressed("left_click") and hovering_object and Global.focus_on == true:
		Global.update_dialog_text.emit(message_text)
		zoom_in_2.visible=true
		fridge_anim.play("color")
		magic.play()
		fridge_find.hide()
		fridge_found=true
		
	elif event.is_action_pressed("left_click") and hovering_object and fridge_found==true:
		Global.update_dialog_text.emit(message_text)
		zoom_in_2.visible=true
		magic.play()
