Class {
	#name : #Agua,
	#superclass : #Topografia,
	#category : #'Objetos2Practica4-eje3-Objetos2Practica4-eje3'
}

{ #category : #equality }
Agua >> = otraTopografia [
	^otraTopografia comparateContraAgua: self
]

{ #category : #equality }
Agua >> comparateContraAgua: aTopologia [
	^ true
]

{ #category : #Accessing }
Agua >> proporcion [ 

^1
]
