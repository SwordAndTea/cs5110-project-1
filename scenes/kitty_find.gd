extends Area2D
@onready var hovering_object : bool = false
@onready var magic: AudioStreamPlayer = $"../../magic"
@onready var kitty_found : bool = false
@onready var zoom_in_4: Sprite2D = $"../../CanvasLayer/Umbrella/UmbrellaGet/ZoomIn4"
@onready var kitty: AnimatedSprite2D = $"../../Interactive/Kitty Area/Kitty/Kitty"
@onready var purr: AudioStreamPlayer = $"../../purr"

signal kittyfound

var pointer = load("res://sprites/pointer.png")
var clicker = load("res://sprites/Clicker.png")

func _on_mouse_entered() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true
	elif Global.is_magnifier_pick_up and kitty_found==true:
		Input.set_custom_mouse_cursor(clicker)
		hovering_object=true
		
func _on_mouse_exited() -> void:
	if Global.is_magnifier_pick_up and Global.focus_on==true:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false
	elif Global.is_magnifier_pick_up and kitty_found==true:
		Input.set_custom_mouse_cursor(pointer)
		hovering_object=false

@export_multiline var message_text : String = ""

func _input(event: InputEvent) -> void:
	if Global.is_magnifier_pick_up and event.is_action_pressed("left_click") and hovering_object and Global.focus_on == true:
		Global.update_dialog_text.emit(message_text)
		zoom_in_4.visible=true
		magic.play()
		purr.play()
		kitty_found=true
		kitty.play("color")
		kittyfound.emit()
	if event.is_action_pressed("ESC"):
		purr.stop()
	
	elif event.is_action_pressed("left_click") and hovering_object and kitty_found==true:
		Global.update_dialog_text.emit(message_text)
		zoom_in_4.visible=true
		magic.play()
	
