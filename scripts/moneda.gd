extends Area2D


# Quiero detectar cuando el jugador entre en contacto
#Uso señales

func _on_body_entered(body: Node2D) -> void:
	print("+1 Moneda!")
	queue_free()

# Recibe de la variable body una referencia de Node2D
# queue_free() Metodo que se invoca para eliminar un objeto