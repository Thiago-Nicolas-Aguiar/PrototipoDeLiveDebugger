extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0 

# No quiero correr, ruedo como en dark souls
const DASH_SPEED = 300
const DASH_COOLDOWN = 1.0
const DASH_DURATION = 0.2

var ESTOY_DASHEANDO: bool = false
var PUEDO_DASHEAR: bool = true



@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:

		# Dash
	if Input.is_action_pressed("Dash"):
		comenzar_dash()
	
	if ESTOY_DASHEANDO:
		move_and_slide()
		return

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("MoverIzquierda", "MoverDerecha")
	
	# Cambios de direccion (sprites)
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	#Animaciones
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("Jump")

	# Cambios de direccion (jugador)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func comenzar_dash():
	var direction := Input.get_axis("MoverIzquierda", "MoverDerecha")

	if not PUEDO_DASHEAR or ESTOY_DASHEANDO:
		return 

	ESTOY_DASHEANDO = true
	PUEDO_DASHEAR = false
	
	velocity.y = 0 

	if direction != 0:
		velocity.x = direction * DASH_SPEED
	else:

		var mirando = -1 if $AnimatedSprite2D.flip_h else 1
		velocity.x = mirando * DASH_SPEED

	await get_tree().create_timer(DASH_DURATION).timeout
	ESTOY_DASHEANDO = false

	await get_tree().create_timer(DASH_COOLDOWN).timeout
	PUEDO_DASHEAR = true

