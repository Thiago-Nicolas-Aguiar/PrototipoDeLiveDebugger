extends Node2D

# Constante para ajustar la velocidad cuando quiera
const velocidadBase = 60

# Vale 1 si va a la derecha, -1 izquierda
var direccion = 1

# Referencia.
@onready var ray_cast_derecha: RayCast2D = $RayCastDerecha
@onready var ray_cast_izquierda: RayCast2D = $RayCastIzquierda
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Si el ray colisiona con algo en su camino cambia la direccion a izquieda
	if ray_cast_derecha.is_colliding():
		direccion = -1
		#Cambio de direccion a ver (izquierda)
		animated_sprite.flip_h = true
	# Y viceversa
	if ray_cast_izquierda.is_colliding():
		direccion = 1
		#Cambio de direccion a ver (derecha)
		animated_sprite.flip_h = false
	position.x += direccion * velocidadBase * delta
