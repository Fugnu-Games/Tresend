extends KinematicBody

signal enemy_dead(body)

export var speed = 15
export var health = 50
export var damage = 20

onready var player = get_tree().get_root().get_node("Main").get_node("Player")

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

	move_and_slide(direction)

	if health <= 0:
		die()

func initialize(start_position, player_pos):
  look_at_from_position(start_position, player_pos, Vector3.UP)

func die():
	emit_signal("enemy_dead", self)
	queue_free()
