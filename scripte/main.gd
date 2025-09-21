extends Node2D

var is_paused = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause_menu"):
		pause_menu()

func pause_menu():
	if is_paused:
		$player/PauseMenu.hide()
		Engine.time_scale = 1
	else:
		$player/PauseMenu.show()
		Engine.time_scale = 0

	is_paused = !is_paused
