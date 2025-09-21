extends Control

@onready var main = $"../../"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.





func _on_start_pressed() -> void:
	main.pause_menu()

func _on_options_pressed() -> void:
	print("options doesn't work yet")

func _on_close_pressed() -> void:
	get_tree().quit()
