extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_Start_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")


func _on_Einstellungen_2_pressed() -> void:
	print("Einstellungen pressed")


func _on_Verlassen_3_pressed() -> void:
	get_tree().quit()
