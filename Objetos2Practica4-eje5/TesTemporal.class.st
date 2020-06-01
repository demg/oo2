Class {
	#name : #TesTemporal,
	#superclass : #TestCase,
	#instVars : [
		'temporal1',
		'temporal2',
		'temporal0'
	],
	#category : #'Objetos2Practica4-eje5'
}

{ #category : #initialization }
TesTemporal >> initializeTemporal [
	temporal0 := Temporal newCasado: false conHijos: 0 con: 0.
	temporal1 := Temporal newCasado: true conHijos: 1 con: 1.
	temporal2 := Temporal newCasado: true conHijos: 3 con: 3
]

{ #category : #running }
TesTemporal >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	self initializeTemporal.
]

{ #category : #tests }
TesTemporal >> testTemporal [
	"testeo de la clase se instancie bien"

	self assert: temporal0 sueldo = 3480.
	self assert: temporal1 sueldo = 4058.70.
	self assert: temporal2 sueldo = 4266.1
]
