extends KinematicBody2D
var Velocidade = Vector2.ZERO
var move_dir = 0
var gravidade = 200
var pular = -100

func _ready():
	pass

func _process(delta):
	move_dir = Input.get_action_strength("direita") - Input.get_action_strength("esquerda")
	if(Input.is_action_just_pressed("cima")):
		Velocidade.y = pular
	Velocidade.y += gravidade*delta
	Velocidade.x = move_dir*100
	
	if move_dir == -1:
		$Animacao.flip_h = false
	else: 
		$Animacao.flip_h = true
	
	if Velocidade.y >=2000:
		Velocidade.y = 2000
	
	move_and_slide(Velocidade)
	pass
