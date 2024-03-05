extends KinematicBody2D

var velocidade := Vector2.ZERO
var gravidade := 800

func _physics_process(delta):
	velocidade.y += gravidade * delta
	
	animacao()
	movimento()
	
	velocidade = move_and_slide(velocidade, Vector2.UP)
	
func movimento():
	if Input.is_action_pressed("ui_right"):
		velocidade.x = 55
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocidade.x = -55
		$AnimatedSprite.flip_h = true
	else:
		velocidade.x = 0
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		Global.pulando = true
		velocidade.y = -180
		$sons/pular.play()
	else:
		Global.pulando = false
	
	if velocidade.x != 0 and is_on_floor() and not is_on_wall():
		if !$sons/andar.is_playing():
			$sons/andar.play()
	else:
		if $sons/andar.is_playing():
			$sons/andar.stop()

func animacao():
	if velocidade.x != 0:
		$AnimatedSprite.play("walk")
	elif not is_on_floor() and velocidade.y < 0:
		$AnimatedSprite.play("jump")
	elif not is_on_floor() and velocidade.y > 0:
		$AnimatedSprite.play("fall")
	else:
		$AnimatedSprite.play("idle")
	
