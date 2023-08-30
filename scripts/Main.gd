extends Node

@export
var enemy_scene : PackedScene

@onready var variables = get_node("/root/Variables")
@onready var platformAnimationPlayer = get_node("Platform/AnimationPlayer")
@onready var enemySpawnTimer = get_node("WaveTimer/EnemySpawnTimer")

@onready var player = get_node("Player")
@onready var waveTimer = get_node("WaveTimer")
@onready var enemySpawnPath = get_node("EnemySpawnPath")
# @onready var light = get_node("DirecitonalLight3D")

var current_level;
var player_pos;
var enemies = [];


func _ready():
	enemySpawnTimer.connect("timeout", Callable(self, "_on_enemySpawnTimer_timeout"))
	player.connect("dead", Callable(self, "_on_player_dead"))
	waveTimer.connect("timeout", Callable(self, "_on_wave_timer_timeout"))
	platformAnimationPlayer.connect("animation_finished", Callable(self, "_on_platform_animation_finished"))

	current_level = variables.current_level;

	enemySpawnPath.position.y = -50 * (current_level - 1)

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene();

func _on_enemySpawnTimer_timeout():
	var enemy = enemy_scene.instantiate()
	var enemy_spawn_location = get_node("EnemySpawnPath/EnemySpawnLocation")

	enemy_spawn_location.progress_ratio = randf()
	player_pos = $Player.transform.origin

	enemy.initialize(enemy_spawn_location.position, player_pos)

	enemy.rotation_degrees.x = 90
	enemy.position.y = -50 * (current_level - 1)
	enemy.position.y += 1.5

	add_child(enemy)	
	enemy.connect("enemy_dead", Callable(self, "_on_enemy_dead"))
	enemies.append(enemy)


func _on_enemy_dead(body):
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

func _on_platform_animation_finished(_anim_name):
	var next_level_path = "res://level_" + str(current_level + 1) + ".tscn"
	variables.current_level = current_level + 1
	# SceneSwitcher.switch_scene(level_path)
	get_tree().change_scene_to_file(next_level_path)
	
