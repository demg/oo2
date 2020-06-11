Class {
	#name : #Connection,
	#superclass : #Object,
	#instVars : [
		'varTest'
	],
	#category : #'Objetos2Practica5-eje3'
}

{ #category : #sending }
Connection >> sendData: aData crc: aNumber [

]

{ #category : #accessing }
Connection >> tipoDeConeccion [
	^ varTest
]

{ #category : #accessing }
Connection >> varTest: anObject [
	^ varTest := anObject
]
