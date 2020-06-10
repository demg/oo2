Class {
	#name : #Personal,
	#superclass : #Object,
	#instVars : [
		'sueldo'
	],
	#category : #'Objetos2Practica4-eje5'
}

{ #category : #'as yet unclassified' }
Personal >> adicional [
	^ self subclassResponsibility  
]

{ #category : #calculating }
Personal >> basico [ 

	^ 2000
]

{ #category : #'as yet unclassified' }
Personal >> descuento [
	^ (self basico * 13 / 100) asFloat 
		+ (self adicional * 5 / 100) asFloat
]

{ #category : #calculating }
Personal >> sueldo [

	^ (self basico + self adicional) - self descuento 
]
