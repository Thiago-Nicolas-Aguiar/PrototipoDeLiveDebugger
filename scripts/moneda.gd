extends Area2D

@onready var game_manager: Node = %ManagerJuego

# Quiero detectar cuando el jugador entre en contacto
#Uso señales

func _on_body_entered(body: Node2D) -> void:
	game_manager.incrementarPuntuacion()
	queue_free()

# Recibe de la variable body una referencia de Node2D
# queue_free() Metodo que se invoca para eliminar un objeto