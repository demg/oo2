Class {
	#name : #Pause,
	#superclass : #State,
	#category : #'Objetos2Practica5-eje1'
}

{ #category : #accessing }
Pause >> togglePause [ 

	status := Progress  newCon: nombre 
]
