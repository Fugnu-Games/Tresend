extends Control

func _ready():
	$Restart.hide()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		$Restart.hide()
		get_tree().reload_current_scene();


func show_restart_msg():
	$Restart.show()
