extends Node2D

onready var Enemy = load("res://Enemy/Enemy.tscn")
onready var Enemy2 = load("res://Enemy/Enemy2.tscn")
onready var Enemy3 = load("res://Enemy/Enemy3.tscn")

var enemy_list = []

var e = 0

func _ready():
	 enemy_list = [
		Enemy,
		Enemy3,
		Enemy2,
		Enemy,
		Enemy2,
		Enemy2,
		Enemy2,
		Enemy2,
		Enemy3,
		Enemy,
		Enemy3,
		Enemy2,
		Enemy,
		Enemy2,
		Enemy2,
		Enemy2,
		Enemy2,
		Enemy3,
		Enemy,
		Enemy3,
		Enemy2,
		Enemy,
		Enemy2,
		Enemy2,
		Enemy2,
		Enemy2,
		Enemy3,
		Enemy,
		Enemy3,
		Enemy2,
		Enemy,
		Enemy2,
		Enemy2,
		Enemy2,
		Enemy2,
		Enemy3,

	]


func _on_Timer_timeout():
	if e < enemy_list.size():
		if enemy_list[e] != null:
			var enemy = enemy_list[e].instance()
			add_child(enemy)
		e += 1
