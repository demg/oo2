Class {
	#name : #TestPlanta,
	#superclass : #TestCase,
	#instVars : [
		'planta0',
		'planta1',
		'planta2'
	],
	#category : #'Objetos2Practica4-eje5'
}

{ #category : #initialization }
TestPlanta >> initializePlanta [
	planta0 := Planta newCasado: false conHijos: 0 con: 0.
	planta1 := Planta newCasado: true conHijos: 1 con: 1.
	planta2 := Planta newCasado: true conHijos: 3 con: 3
]

{ #category : #running }
TestPlanta >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	self initializePlanta.
]

{ #category : #tests }
TestPlanta >> testPlanta [
	"testeo de la clase se instancie bien"

	self assert: planta0 cantidadDeAños isNotNil .
	self assert: planta0 cantidadDeHijos isNotNil .
	self assert: planta0 casado isNotNil .
	self assert: planta0 basico = 3000.
]

{ #category : #tests }
TestPlanta >> testPlantaCalcularSueldo [
	"testeo de la clase se instancie bien"

	self assert: planta0 sueldo  = 2610.
	self assert: planta1 sueldo  = 3275.
	self assert: planta2 sueldo  = 3655.
"	
	self assert: planta1 cantidadDeAños = 1 .
	self assert: planta1 cantidadDeHijos = 1 .
	self assert: planta1 casado = true.
	
		self assert: planta2 cantidadDeAños = 3 .
	self assert: planta2 cantidadDeHijos = 3 .
	self assert: planta2 casado = true.
"
]

{ #category : #tests }
TestPlanta >> testPlantaCantidades [
	"testeo de la clase se instancie bien"

	self assert: planta0 cantidadDeAños = 0 .
	self assert: planta0 cantidadDeHijos = 0 .
	self assert: planta0 casado = false.
	
	self assert: planta1 cantidadDeAños = 1 .
	self assert: planta1 cantidadDeHijos = 1 .
	self assert: planta1 casado = true.
	
		self assert: planta2 cantidadDeAños = 3 .
	self assert: planta2 cantidadDeHijos = 3 .
	self assert: planta2 casado = true.

]
