Class {
	#name : #Progress,
	#superclass : #State,
	#category : #'Objetos2Practica5-eje1'
}

{ #category : #accessing }
Progress >> togglePause [ 

	status := Pause newCon: nombre 
]
