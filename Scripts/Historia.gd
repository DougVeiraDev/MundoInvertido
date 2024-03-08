extends Node2D

var inicio := true
var esperar_enter := false

func _ready():
	pass

func _process(delta):
	
	if inicio:
		
		$Label.visible = true
		$Label3.visible = false
	elif not inicio:		
		$Label.visible = false
		$Label3.visible = true
		
		
	
	if Input.is_action_just_pressed("enter") and not esperar_enter:
		$TileMap2.visible = true
		$texto.play()
		inicio = false
		esperar_enter = true
	elif Input.is_action_just_pressed("enter") and esperar_enter:
		$texto.play()
		$AudioStreamPlayer.stop()
		get_tree().change_scene("res://Cenas/Level_01.tscn")
		


