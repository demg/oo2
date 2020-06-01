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

	casado ifTrue: [ ^ (cantidadDeHijos * 100) + 500   ].
	^ (cantidadDeHijos * 100)
]

{ #category : #'as yet unclassified' }
Empleado >> cantidad: aNumber [
^SubclassResponsibility 
]

{ #category : #initialize }
Empleado >> inicializarCasado: aCasado conHijo: hijos con: años. [

self initialize .
 self cantidad:  años.
cantidadDeHijos := hijos.
casado := aCasado
]
