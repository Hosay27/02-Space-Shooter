extends Area2D

var velocity = Vector2(0, -300)
var damage = 5

onready var Explosion = load("res://Effects/Explosion.tscn")
var Effects = null

func _physics_process(delta):
	position += velocity.rotated(rotation)*delta
	position.x = clamp(position.x, 0, Global.VP.x)
	position.y = clamp(position.y, 0, Global.VP.y)


func _on_Enemy_X_Bullet_body_entered(body):
	if not body.is_in_group("enemy"):
		if body.has_method("damage"):
			body.damage(damage)
		Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var explosion = Explosion.instance()
			explosion.global_position = global_position
			Effects.add_child(explosion)
		queue_free()

