extends Control

@onready var player = get_node("../Player")

func _ready():
	player.connect("dead", Callable(self, "_on_player_dead"))
	$Restart.hide()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		$Restart.hide()
		get_tree().reload_current_scene();



func _on_player_dead():
	$Restart.show()
