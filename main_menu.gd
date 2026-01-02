extends Control

@onready var main_buttons: VBoxContainer = $"Main Buttons"
@onready var Einstellungen: Panel = $Einstellungen




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _ready():
	main_buttons.visible = true
	Einstellungen.visible = false
	

func _on_Start_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")


func _on_Einstellungen_2_pressed() -> void:
	print("Einstellungen pressed")
	main_buttons.visible = false
	Einstellungen.visible = true


func _on_Verlassen_3_pressed() -> void:
	get_tree().quit()


func _on_zurück_Einstellungen_pressed() -> void:
	_ready()
	
