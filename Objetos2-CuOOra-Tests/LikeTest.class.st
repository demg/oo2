"
A LikeTest is a test class for testing the behavior of Like
"
Class {
	#name : #LikeTest,
	#superclass : #TestCase,
	#instVars : [
		'pastorsin',
		'like',
		'creacionLike',
		'skydler'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #'private-initialize' }
LikeTest >> initializeUsuarios [
	pastorsin := Usuario newNombre: 'Pastorsin' contrasena: 'quiero-aprobar'.
	skydler := Usuario newNombre: 'Skydler' contrasena: 'quiero-aprobar'
]

{ #category : #running }
LikeTest >> setUp [
	self initializeUsuarios.
	like := Like newPuntuador: pastorsin.
	creacionLike := DateAndTime now
]

{ #category : #'tests-constructor' }
LikeTest >> testConstructor [
	self assert: (like tuPuntuadorEs: pastorsin).
	self assert: like fechaDeCreacion equals: creacionLike asDate.
	self assert: like horaDeCreacion hours equals: creacionLike hours.
	self assert: like horaDeCreacion minutes equals: creacionLike minutes
]

{ #category : #'tests-comparing' }
LikeTest >> testEsLike [
	self assert: like esLike.
]

{ #category : #'tests-creacion' }
LikeTest >> testFechaDeCreacion [
	self assert: like fechaDeCreacion equals: creacionLike asDate.
]

{ #category : #'tests-creacion' }
LikeTest >> testHoraDeCreacion [
	self assert: like horaDeCreacion hours equals: creacionLike hours.
	self assert: like horaDeCreacion minutes equals: creacionLike minutes
]

{ #category : #'tests-comparing' }
LikeTest >> testTuPuntuadorEs [
	self assert: (like tuPuntuadorEs: pastorsin).
	self deny: (like tuPuntuadorEs: skydler)
]
