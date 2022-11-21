extends StaticBody

export var damage = 50

var enemy;

func _on_SamuraiSwordHitBox_body_entered(body:Node):
	if body.is_in_group("enemies"):
		enemy = get_tree().get_root().get_node("Main").get_node(body.name)
		enemy.health -= damage
