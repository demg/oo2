Class {
	#name : #Tierra,
	#superclass : #Topografia,
	#category : #'Objetos2Practica4-eje3-Objetos2Practica4-eje3'
}

{ #category : #equality }
Tierra >> = otraTopografia [
	^ otraTopografia comparateContraTierra: self
]

{ #category : #equality }
Tierra >> comparateContraTierra: unTopografia [

^ true 
]

{ #category : #accessing }
Tierra >> proporcion [ 
^0
]
