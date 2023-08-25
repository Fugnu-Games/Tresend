extends Node

export (PackedScene) var enemy_scene 

var player_pos;
var enemies = [];


func _on_EnemySpawnTimer_timeout():
	var enemy = enemy_scene.instance()
	var enemy_spawn_location = get_node("EnemySpawnPath/EnemySpawnLocation")

	enemy_spawn_location.unit_offset = randf()
	player_pos = $Player.transform.origin

	enemy.initialize(enemy_spawn_location.translation, player_pos)

	enemy.rotation_degrees.x = 90
	enemy.translation.y = 1.5

	add_child(enemy)	
	enemy.connect("enemy_dead", self, "_on_Enemy_Dead")
	enemies.append(enemy)

func _on_Player_dead():
	$EnemySpawnTimer.stop()

	for enemy in enemies:
		enemy.queue_free()
		enemies.erase(enemy)


func _on_Enemy_Dead(body):
	$Player.score += 1
	enemies.erase(body)

