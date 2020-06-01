Class {
	#name : #Pending,
	#superclass : #State,
	#category : #'Objetos2Practica5-eje1'
}

{ #category : #accessing }
Pending >> start [ 
	
	status:= Progress newCon: nombre
]

{ #category : #accessing }
Pending >> togglePause [ 

	status :=  Finished   newCon: nombre 
]
