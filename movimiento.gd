extends CharacterBody2D

const SPEED = 200
const JUMP_SPEED = 600
const SPRINT = 400

func _physics_process(delta: float) -> void:
	
	#MOVIMIENTO DERECHA E IZQUIERDA
	if Input.is_action_pressed("der"):
		velocity.x = SPEED
	elif Input.is_action_pressed("izq"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
	
	#MOVIMIENTO SALTO
	if not is_on_floor():
		velocity = velocity + get_gravity() * delta
	
	if is_on_floor() and Input.is_action_just_pressed("saltar"):
		velocity.y = -JUMP_SPEED
	
	#MOVIMIENTO SPRINT
	if Input.is_action_pressed("der") and Input.is_action_pressed("sprint"):
		velocity.x = SPRINT
		
	if Input.is_action_pressed("izq") and Input.is_action_pressed("sprint"):
		velocity.x = -SPRINT
	
	move_and_slide()
