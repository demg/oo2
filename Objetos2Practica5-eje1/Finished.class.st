Class {
	#name : #Finished,
	#superclass : #State,
	#category : #'Objetos2Practica5-eje1'
}

{ #category : #accessing }
Finished >> togglePause [ 

	status := Pending    newCon: nombre 
]

{ #category : #'changing state' }
Finished >> workedTime [
"Retornar inicio y fin "
	^ timer 
]
