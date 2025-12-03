extends Control

@onready var main_buttons: VBoxContainer =$"Main Buttons"
@onready var Einstellungen: Panel =$Options
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("Start pressed")
	
	func _ready():
	main_buttons.visible = true
	Einstellugen.visible = false


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")

func _on_Verlassen_3_pressed() -> void:
	get_tree().quit()
	
	func _on_Einstellungen_pressed():
	print("Einstellungen pressed")
	main_buttons.visible = false
	Einstellugen.visible = true


func _on_zurück_Einstellungen_pressed() -> void:
	_ready()
