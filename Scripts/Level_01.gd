extends Node2D


func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		$Mundo1.visible = !$Mundo1.visible
		$Mundo1.collision_mask = !$Mundo1.collision_mask
		if $ParallaxBackground/ParallaxLayer/Sprite.rotation_degrees == 0:
			$ParallaxBackground/ParallaxLayer/Sprite.rotation_degrees = 180
		elif $ParallaxBackground/ParallaxLayer/Sprite.rotation_degrees == 180:
				$ParallaxBackground/ParallaxLayer/Sprite.rotation_degrees = 0
		
		$Mundo2.visible = !$Mundo2.visible
		$Mundo2.collision_mask = !$Mundo2.collision_mask


func _on_portal_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://Cenas/Node2D.tscn")
