extends Node2D


func _ready():
	pass
func _process(delta):
	if Input.is_action_just_pressed("enter"):
		$AudioStreamPlayer2D.stop()
		get_tree().change_scene("res://Cenas/Introdução.tscn")
