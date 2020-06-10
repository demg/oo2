Class {
	#name : #Empleado,
	#superclass : #Personal,
	#instVars : [
		'cantidadDeHijos',
		'casado'
	],
	#category : #'Objetos2Practica4-eje5'
}

{ #category : #'instance creation' }
Empleado class >> newCasado: esCasado conHijos: hijos con: horas [
^ self new inicializarCasado: esCasado conHijo:hijos  con: horas

]

{ #category : #'as yet unclassified' }
Empleado >> adicional [
	casado
		ifTrue: [ ^ self calcularXCantidadDeHijos + 500 ].
	^ self calcularXCantidadDeHijos
]

{ #category : #'as yet unclassified' }
Empleado >> calcularXCantidadDeHijos [
	^ self  cantidadDeHijos * 100
]

{ #category : #'as yet unclassified' }
Empleado >> cantidad: aNumber [
^SubclassResponsibility 
]

{ #category : #accessing }
Empleado >> cantidadDeHijos [
	^ cantidadDeHijos
]

{ #category : #accessing }
Empleado >> casado [
	^ casado
]

{ #category : #initialize }
Empleado >> inicializarCasado: aCasado conHijo: hijos con: años. [

 self cantidad:  años.
cantidadDeHijos := hijos.
casado := aCasado
]
