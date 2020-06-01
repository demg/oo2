Class {
	#name : #Planta,
	#superclass : #Empleado,
	#instVars : [
		'cantidadDeAños'
	],
	#category : #'Objetos2Practica4-eje5'
}

{ #category : #'as yet unclassified' }
Planta >> adicional [
	^ super adicional + (self cantidadDeAños * 100)
]

{ #category : #calculating }
Planta >> basico [ 

^ super basico + 1000
]

{ #category : #'as yet unclassified' }
Planta >> cantidad: aNumber [

	cantidadDeAños := aNumber
]

{ #category : #accessing }
Planta >> cantidadDeAños [
	^ cantidadDeAños
]

{ #category : #accessing }
Planta >> cantidadDeHijos [
	^ cantidadDeHijos
]

{ #category : #accessing }
Planta >> casado [
	^ casado
]
