extends Control


func _ready():
	update_score()
	update_time()

func update_score():
	$Score.text = "Score: " + str(Global.score)

func update_time():
	$Time.text = "Time: " + str(Global.time)


func _on_Timer_timeout():
	Global.time -= 1
	update_time()
