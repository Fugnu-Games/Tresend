extends KinematicBody

signal dead 

export var speed := 20.0
export var jump_strength := 20.0
export var gravity = 50.0
export var mouse_sensitivity = 0.1
export var health := 1

var colliding_enemies = [];
var enemies;

var score = 10;

var ability_used = false;

var velocity = Vector3.ZERO;
var snap_vector = Vector3.DOWN;
var acceleration = 5;

onready var current_weapon = "SamuraiSword" 
onready var pivot = $CameraPivot
onready var weapon_pivot = $WeaponPivot

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
		pivot.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity))
		pivot.rotation.x = clamp(pivot.rotation.x, deg2rad(-90), deg2rad(90))
		
		weapon_pivot.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity))
		weapon_pivot.rotation.x = clamp(pivot.rotation.x, deg2rad(-90), deg2rad(90))

func _physics_process(delta):
	var move_direction := Vector3.ZERO
	if Input.is_action_pressed("move_back"):
		move_direction += transform.basis.z
	elif Input.is_action_pressed("move_foreward"):
		move_direction -= transform.basis.z
	if Input.is_action_pressed("move_right"):
		move_direction += transform.basis.x
	elif Input.is_action_pressed("move_left"):
		move_direction -= transform.basis.x

	if Input.is_action_pressed("use_ability") and not ability_used and can_use_ability():
		use_ability()

	move_direction = move_direction.normalized()

	velocity.x = move_direction.x * speed
	velocity.z = move_direction.z * speed
	velocity.y -= gravity * delta
	
	var just_landed = is_on_floor() and snap_vector == Vector3.ZERO
	var is_jumping = is_on_floor() and Input.is_action_just_pressed("jump")
	
	if is_jumping:
		velocity.y = jump_strength
		snap_vector = Vector3.ZERO
	elif just_landed:
		snap_vector = Vector3.DOWN
		
	velocity.linear_interpolate(velocity, acceleration * delta)
	velocity = move_and_slide_with_snap(velocity, snap_vector, Vector3.UP, true)

	if health <= 0:
		emit_signal("dead")
		queue_free()


func _on_PlayerHitBox_body_entered(body:Node):
	if body.is_in_group("enemies") and colliding_enemies.has(body) == false:
		colliding_enemies.append(body)
		health -= get_tree().get_root().get_node("Main").get_node(body.name).get("damage")
		$HitBoxTimer.start()

func _on_PlayerHitBox_body_exited(body:Node):
		colliding_enemies.erase(body)
		$HitBoxTimer.stop()

func _on_HitBoxTimer_timeout():
	for enemy in colliding_enemies:
		health -= get_tree().get_root().get_node("Main").get_node(enemy.name).get("damage")


func use_ability():
	ability_used = true;
	score = 0;

	for enemy in get_parent().enemies:
		enemy.queue_free()
	get_parent().enemies = []

func can_use_ability():
	if score >= 10:
		return true
	else:
		ability_used = false
		return false

