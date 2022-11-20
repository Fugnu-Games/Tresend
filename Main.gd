extends Node

export (PackedScene) var enemy_scene 

var enemies = []

func _on_EnemySpawnTimer_timeout():
	# Create a new instance of the Mob scene.
	var enemy = enemy_scene.instance()

	# Choose a random location on the SpawnPath.
	# We store the reference to the SpawnLocation node.
	var enemy_spawn_location = get_node("EnemySpawnPath/EnemySpawnLocation")

	# And give it a random offset.
	enemy_spawn_location.unit_offset = randf()

	#var player_position = $Player.transform.origin
	#enemy.initialize(enemy_spawn_location.translation, player_position)

	add_child(enemy)	
	enemies.append(enemy)

func _on_Player_dead():
	pass	
