Class {
	#name : #Temporal,
	#superclass : #Empleado,
	#instVars : [
		'cantidadDeHorasTrabajadas'
	],
	#category : #'Objetos2Practica4-eje5'
}

{ #category : #calculating }
Temporal >> basico [
	^ super basico + 2000 + (self cantidadDeHorasTrabajadas * 10)
]

{ #category : #'as yet unclassified' }
Temporal >> cantidad: aNumber [

	cantidadDeHorasTrabajadas := aNumber.
]

{ #category : #accessing }
Temporal >> cantidadDeHorasTrabajadas [
	^ cantidadDeHorasTrabajadas
]

{ #category : #initialize }
Temporal >> inicializarCon: aObject con: horas casado: esCasado [
	self initialize.
	cantidadDeHorasTrabajadas := aObject.
	cantidadDeHijos := horas.
	casado := esCasado
]
