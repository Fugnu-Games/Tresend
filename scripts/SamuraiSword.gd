extends StaticBody3D

@export var damage = 30

@onready var samuraiSwordHitBox = get_node("SamuraiSwordHitBox")

func _ready():
	samuraiSwordHitBox.connect("body_entered", Callable(self, "_on_samuraiSwordHitBox_body_entered"))	

func _on_samuraiSwordHitBox_body_entered(body:Node):
	if body.is_in_group("enemies") and Input.is_action_pressed("use_weapon"):
		body.health -= damage


