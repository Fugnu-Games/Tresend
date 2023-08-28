extends CharacterBody3D

signal enemy_dead(body)

@export var speed = 10
@export var health = 50
@export var damage = 20

@onready var player = get_node("../Player")

var player_position;
var direction;


func _physics_process(_delta):
	player_position = player.transform.origin

	if player_position.distance_to(transform.origin) > 0.05:
		direction = player_position - transform.origin
		direction.y = 0
		direction = direction.normalized() * speed
	else: 
		direction = player_position - transform.origin

	set_velocity(direction)
	move_and_slide()

	if health <= 0:
		die()

func initialize(start_position, player_pos):
	look_at_from_position(start_position, player_pos, Vector3.UP)

func die():
	emit_signal("enemy_dead", self)
	queue_free()
