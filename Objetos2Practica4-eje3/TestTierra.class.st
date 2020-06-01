Class {
	#name : #TestTierra,
	#superclass : #TestCase,
	#category : #'Objetos2Practica4-eje3'
}

{ #category : #tests }
TestTierra >> testNoAguaTopografia [
	self deny: [ Tierra new proporcion = 1 ]
]

{ #category : #tests }
TestTierra >> testNoMixtaTopografia [
	self deny: [ Tierra  new proporcion = 1 ]
]

{ #category : #tests }
TestTierra >> testTierraTopografia [
	self assert: [ Tierra  new proporcion = 0 ]
]
