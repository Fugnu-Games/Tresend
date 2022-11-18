extends KinematicBody

export var speed = 15
export var health = 50

onready var player = get_tree().get_root().get_node("Main").get_node("Player")
onready var current_weapon = player.get("current_weapon")
onready var damage = player.get("damage")

var player_position;
var direction;

func _physics_process(_delta):
	player_position = player.translation

	if player_position.distance_to(transform.origin) > 0.05:
		direction = player_position - transform.origin
		direction.y = 0
		direction = direction.normalized() * speed
	else: 
		direction = player_position - transform.origin

	move_and_slide(direction)

	if health <= 0:
		queue_free()


func _on_Area_body_entered(body:Node):
	if body.name == current_weapon:
		health -= damage
