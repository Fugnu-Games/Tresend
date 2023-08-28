extends Node

@export
var enemy_scene : PackedScene

var player_pos;
var enemies = [];

@onready var platformAnimationPlayer = get_node("Platform/AnimationPlayer")
@onready var enemySpawnTimer = get_node("WaveTimer/EnemySpawnTimer")

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene();

func _on_EnemySpawnTimer_timeout():
	var enemy = enemy_scene.instantiate()
	var enemy_spawn_location = get_node("EnemySpawnPath/EnemySpawnLocation")

	enemy_spawn_location.progress_ratio = randf()
	player_pos = $Player.transform.origin

	enemy.initialize(enemy_spawn_location.position, player_pos)

	enemy.rotation_degrees.x = 90
	enemy.position.y = 1.5

	add_child(enemy)	
	enemy.connect("enemy_dead", Callable(self, "_on_Enemy_Dead"))
	enemies.append(enemy)


func _on_Enemy_Dead(body):
	$Player.score += 1
	enemies.erase(body)

	if $Player.score == 10:
		print_debug("Tresending.....")
		platformAnimationPlayer.play("move_platform")



func _on_player_dead():
	enemySpawnTimer.stop()

	for enemy in enemies:
		enemy.queue_free()
		enemies.erase(enemy)



func _on_wave_timer_timeout():
	enemySpawnTimer.stop()
