Class {
	#name : #Topografia,
	#superclass : #Object,
	#category : #'Objetos2Practica4-eje3-Objetos2Practica4-eje3'
}

{ #category : #equality }
Topografia >> = otraTopografia [

	^ SubclassResponsibility 
]

{ #category : #accessing }
Topografia >> compararContraMixta: aTopografia [
	^ false
]

{ #category : #accessing }
Topografia >> comparateContraAgua: aTopologia [
	^ false
]

{ #category : #accessing }
Topografia >> comparateContraTierra: unTopografia [
	^ false
]

{ #category : #accessing }
Topografia >> proporcion [ 
^ SubclassResponsibility 
]

{ #category : #accessing }
Topografia >> proporcion: anObject [
	proporcion := anObject
]
