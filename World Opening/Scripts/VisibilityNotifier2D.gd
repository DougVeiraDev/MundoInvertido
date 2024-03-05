extends VisibilityNotifier2D

onready var pai = get_parent()

func _ready():
	pass

func _on_Otimizador_screen_entered():
	pai.visible = true

func _on_Otimizador_screen_exited():
	pai.visible = false
	
