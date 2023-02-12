extends KinematicBody2D

var positions = [
	Vector2(0,300)
	,Vector2(100,200)
	,Vector2(300,300)
	,Vector2(500,200)
	,Vector2(700,300)

]

var p = 0
var health = 2
var score = 25

onready var Bullet = load("res://Enemy/Enemy_Bullet.tscn")

func _ready():
	position = positions[p]
	$Tween.interpolate_property(self, "position", positions[p], positions[p+1], 3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0)
	$Tween.start()
	p += 1

func _on_Tween_tween_all_completed():
	if p+1 >= positions.size():
		queue_free()
	else:
		$Tween.interpolate_property(self, "position", positions[p], positions[p+1], 3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0)
		$Tween.start()
		p += 1

func damage(d):
	health -= d
	if health <0:
		Global.update_score(score)
		queue_free()


func _on_Timer_timeout():
	var Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		var Enemy_Bullet_Sound = get_node_or_null("/root/Game/Enemy_Bullet_Sound3")
		if Enemy_Bullet_Sound != null:
			Enemy_Bullet_Sound.play()
		var bullet = Bullet.instance()
		bullet.global_position = global_position + Vector2(0,30)
		bullet.rotation = PI
		Effects.add_child(bullet)
