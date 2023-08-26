extends StaticBody3D

@export var damage = 50

func _on_SamuraiSwordHitBox_body_entered(body:Node):
	if body.is_in_group("enemies") and Input.is_action_pressed("use_weapon"):
		body.health -= damage


