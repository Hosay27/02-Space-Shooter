extends Area2D

var velocity = Vector2(0, -800)
var damage = 2

onready var Explosion = load("res://Effects/Explosion.tscn")
var Effects = null

func _physics_process(delta):
	position += velocity*delta
	if position.y < 0:
		queue_free()


func _on_Bullet_body_entered(body):
	if body.name != "Player" and body.has_method("damage"):
		body.damage(damage)
		Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var explosion = Explosion.instance()
			explosion.global_position = global_position
			Effects.add_child(explosion)
	queue_free()
