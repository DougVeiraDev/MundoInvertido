extends Node2D

var label : Label
var stop := false

func _ready():
	
	label = $Label
	start()
	
func start():
	$Timer.wait_time = 0.2
	$Timer.start()
	
func _process(delta):
	if Input.is_action_just_pressed("enter"):
		stop = true
		$start.play()
		$AudioStreamPlayer.stop()
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Cenas/Level_01.tscn")
	
	if stop:
		$Label.visible = true

func _on_Timer_timeout():
	if not stop:
		label.visible = not label.visible
		start()
