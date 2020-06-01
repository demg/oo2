"
A TopicoTest is a test class for testing the behavior of Topico
"
Class {
	#name : #TopicoTest,
	#superclass : #TestCase,
	#instVars : [
		'deportes',
		'deportes2',
		'ciencia'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #'private-initialize' }
TopicoTest >> initializeTopicos [
	deportes := Topico
		newNombre: 'Deportes'
		descripcion: 'una descripción'.
	deportes2 := Topico
		newNombre: 'Deportes'
		descripcion: 'otra descripción'.
	ciencia := Topico
		newNombre: 'Ciencia'
		descripcion: 'sí, otra descripción'
]

{ #category : #running }
TopicoTest >> setUp [
	self initializeTopicos
]

{ #category : #'tests-constructor' }
TopicoTest >> testConstructor [
	self assert: deportes nombre equals: 'Deportes'.
	self assert: deportes descripcion equals: 'una descripción'
	
]

{ #category : #'tests-query' }
TopicoTest >> testSosIgualA [
	self assert: (deportes sosIgualA: deportes2).
	self deny: (deportes sosIgualA: ciencia).
]

{ #category : #'tests-query' }
TopicoTest >> testTuNombreEs [
	self assert: (deportes tuNombreEs: 'Deportes').
	self deny: (deportes tuNombreEs: 'a')
]
