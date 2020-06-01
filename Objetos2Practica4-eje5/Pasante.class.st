Class {
	#name : #Pasante,
	#superclass : #Personal,
	#instVars : [
		'cantidadDeExamenes'
	],
	#category : #'Objetos2Practica4-eje5'
}

{ #category : #'instance creation' }
Pasante class >> newCon: cantExamen [

	^self new inicializarCon: cantExamen.
]

{ #category : #'as yet unclassified' }
Pasante >> adicional [
	^ 100 * self cantidadDeExamenes 
]

{ #category : #accessing }
Pasante >> cantidadDeExamenes [
	^ cantidadDeExamenes
]

{ #category : #initialize }
Pasante >> inicializarCon: aObject [

self initialize .
  cantidadDeExamenes  := aObject
]
