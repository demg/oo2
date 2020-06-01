Class {
	#name : #TestMixta,
	#superclass : #TestCase,
	#instVars : [
		'tierra1',
		'tierra2',
		'agua1',
		'agua2',
		'mix1',
		'mix2',
		'agua3',
		'agua4',
		'mixtaCon3Agua',
		'mixaguatierra',
		'mixtierraagua'
	],
	#category : #'Objetos2Practica4-eje3'
}

{ #category : #running }
TestMixta >> initializeAgua [
	"Hooks that subclasses may override to define the fixture of test."
	agua1 := Agua  new .
	agua2 := Agua  new .
	agua3 := Agua  new .
	agua4 := Agua  new .
	
	
	
]

{ #category : #running }
TestMixta >> initializeMixta [
	"Hooks that subclasses may override to define the fixture of test."
	mix1 := Mixto con: agua1  con: tierra1 con:agua2  con:tierra2   .
	mix2 := Mixto con: agua1  con: tierra1 con:agua2  con:tierra2   .
	"tiene distinto orden agua tierra agua tierra contra tierra tierra agua agua"
	mixaguatierra := Mixto con: agua1  con: tierra1 con:agua2  con:tierra2   .
	mixtierraagua := Mixto con: tierra1  con: tierra2 con:agua1  con:agua2.  
	
	mixtaCon3Agua := Mixto con: agua1  con: agua3  con:agua2  con:tierra2   .
	
	
	
]

{ #category : #running }
TestMixta >> initializeTierra [
	"Hooks that subclasses may override to define the fixture of test."
	tierra1 := Tierra  new .
	tierra2 := Tierra  new .
	
]

{ #category : #running }
TestMixta >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	self initializeTierra.
	self initializeAgua.
	self initializeMixta.
]

{ #category : #tests }
TestMixta >> test3AguasMixtaTopografia [ 
	self deny: ( mixtaCon3Agua proporcion = (1/2 asNumber )  )
]

{ #category : #tests }
TestMixta >> testDesIgualMixtaTopografia [ 
	self deny:  ( mix1  = mixtaCon3Agua )
]

{ #category : #tests }
TestMixta >> testIgualMixtaTopografia [
	self assert: mix1 = mix2
]

{ #category : #tests }
TestMixta >> testMixtaDesordenadoTopografia [ 
	self deny:    (mixaguatierra  = mixtierraagua  )
]

{ #category : #tests }
TestMixta >> testMixtaTopografia [ 
	self assert: [ mix1 proporcion = (1/2 asNumber )  ]
]
