Class {
	#name : #TestPasante,
	#superclass : #TestCase,
	#instVars : [
		'pasante1',
		'pasante2',
		'pasante0'
	],
	#category : #'Objetos2Practica4-eje5'
}

{ #category : #initialization }
TestPasante >> initializePasante [
	pasante0 := Pasante newCon: 0.
	pasante1 := Pasante newCon: 1.
	pasante2 := Pasante newCon: 2
]

{ #category : #running }
TestPasante >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	self initializePasante.
]

{ #category : #tests }
TestPasante >> testPasante [
	"testeo de la clase se instancie bien"

	self assert:   pasante0 cantidadDeExamenes isNotNil .
	self assert: pasante0 basico equals: 2000.

]

{ #category : #tests }
TestPasante >> testPasanteCalcularSueldo [
	"testeo de la clase se instancie bien"
	self assert: pasante0 sueldo  equals: 1740.
	self assert: pasante1 sueldo  equals: 1835.
	self assert: pasante2 sueldo  equals: 1930.
	

]

{ #category : #tests }
TestPasante >> testPasanteCantidades [
	"testeo de la clase se instancie bien"

	self assert: pasante1 cantidadDeExamenes equals: 1 .
	self assert: pasante1 basico equals: 2000.

]
