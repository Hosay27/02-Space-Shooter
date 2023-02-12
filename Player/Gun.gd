extends Area2D

var nose = Vector2(0,-60)

onready var Bullet = load("res://Player/Bullet.tscn")
var ready = true


var Bullet_Sound = null

func shoot(rot, pos):
	if ready:
		var Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			Bullet_Sound = get_node_or_null("/root/Game/Bullet_Sound")
			if Bullet_Sound != null:
				Bullet_Sound.play()
			var bullet = Bullet.instance()
			Effects.add_child(bullet)
			bullet.rotation = rot
			bullet.global_position = pos
			ready = false
			$Timer.start()

func _on_Timer_timeout():
	ready = true
