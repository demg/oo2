"
A DislikeTest is a test class for testing the behavior of Dislike
"
Class {
	#name : #DislikeTest,
	#superclass : #TestCase,
	#instVars : [
		'pastorsin',
		'creacionDislike',
		'skydler',
		'dislike'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #'private-initialize' }
DislikeTest >> initializeUsuarios [
	pastorsin := Usuario newNombre: 'Pastorsin' contrasena: 'quiero-aprobar'.
	skydler := Usuario newNombre: 'Skydler' contrasena: 'quiero-aprobar'.
]

{ #category : #running }
DislikeTest >> setUp [
	self initializeUsuarios.
	dislike := Dislike newPuntuador: pastorsin.
	creacionDislike := DateAndTime now.
]

{ #category : #'tests-constructor' }
DislikeTest >> testConstructor [
	self assert: (dislike tuPuntuadorEs: pastorsin).
	self assert: dislike fechaDeCreacion equals: creacionDislike asDate.
	self assert: dislike horaDeCreacion hours equals: creacionDislike hours.
	self assert: dislike horaDeCreacion minutes equals: creacionDislike minutes
]

{ #category : #'tests-comparing' }
DislikeTest >> testEsLike [
	self deny: dislike esLike
]

{ #category : #'tests-creacion' }
DislikeTest >> testFechaDeCreacion [
	self assert: dislike fechaDeCreacion equals: creacionDislike asDate.
]

{ #category : #'tests-creacion' }
DislikeTest >> testHoraDeCreacion [
	self assert: dislike horaDeCreacion hours equals: creacionDislike hours.
	self assert: dislike horaDeCreacion minutes equals: creacionDislike minutes
]

{ #category : #'tests-comparing' }
DislikeTest >> testTuPuntuadorEs [
	self assert: (dislike tuPuntuadorEs: pastorsin).
	self deny: (dislike tuPuntuadorEs: skydler)
]
