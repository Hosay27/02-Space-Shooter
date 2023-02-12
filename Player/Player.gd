extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 250
var max_speed = 400

var nose = Vector2(0,-60)

var health = 5

onready var Bullet = load("res://Player/Bullet.tscn")
onready var Explosion = load("res://Effects/Explosion.tscn")
var Effects = null

var Bullet_Sound = null

func _ready():
	pass

func _physics_process(_delta):
	velocity = get_input()*speed
	velocity = velocity.normalized()*clamp(velocity.length(), 0, max_speed)
	velocity = move_and_slide(velocity, Vector2.ZERO)
	position.x = clamp(position.x, 0, Global.VP.x)
	position.y = clamp(position.y, 0, Global.VP.y)

func get_input():
	var dir = Vector2.ZERO
	if Input.is_action_pressed("up"):
		dir += Vector2(0,-1)
	if Input.is_action_pressed("down"):
		dir += Vector2(0,1)
	if Input.is_action_pressed("left"):
		dir += Vector2(-1,0)
	if Input.is_action_pressed("right"):
		dir += Vector2(1,0)
	if Input.is_action_pressed("shoot"):
		shoot()
	return dir

func shoot():
	for g in $Primary.get_children():
		if g.has_method("shoot"):
			g.shoot(rotation, global_position + nose)

func damage(d):
	health -= d
	if health <= 0:
		Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var explosion = Explosion.instance()
			explosion.global_position = global_position
			Effects.add_child(explosion)
		Global.update_lives(-1)
		queue_free()


func _on_Area2D_body_entered(body):
	if body.name != "Player":
		if body.has_method("damage"):
			body.damage(5)
		damage(1)
