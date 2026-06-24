extends Node

var puntuacion = 0

@onready var etiqueta_puntuacion: Label = $EtiquetaPuntuacion

func incrementarPuntuacion():
	puntuacion += 1
	etiqueta_puntuacion.text = "Monedas\n"+str(puntuacion)+" obtenidas."
