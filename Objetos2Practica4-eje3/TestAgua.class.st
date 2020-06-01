Class {
	#name : #TestAgua,
	#superclass : #TestCase,
	#instVars : [
		'agua1',
		'agua2',
		'tierra1'
	],
	#category : #'Objetos2Practica4-eje3'
}

{ #category : #running }
TestAgua >> initializeAgua [
	"Hooks that subclasses may override to define the fixture of test."
	agua1 := Agua new.
	agua2 := Agua new
]

{ #category : #running }
TestAgua >> initializeTierra [ 
	"Hooks that subclasses may override to define the fixture of test."
	tierra1  := Tierra new.

]

{ #category : #running }
TestAgua >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	self initializeAgua.
	self initializeTierra.
]

{ #category : #tests }
TestAgua >> testAguaTopografia [
	self should: [ Agua new proporcion = 1 ]
]

{ #category : #tests }
TestAgua >> testDesIgualAguaTopografia [
	self deny: ( agua1 = tierra1 )
]

{ #category : #tests }
TestAgua >> testIgualAguaTopografia [
	self assert:( agua1 = agua2 )
]

{ #category : #tests }
TestAgua >> testNoMixtaTopografia [

	self deny: [ Agua new proporcion = 0 ]
]

{ #category : #tests }
TestAgua >> testNoTierraTopografia [

	self  deny: [ Agua new proporcion = 0 ]
]
