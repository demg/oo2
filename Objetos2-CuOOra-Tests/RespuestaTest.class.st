"
A RespuestaTest is a test class for testing the behavior of Respuesta
"
Class {
	#name : #RespuestaTest,
	#superclass : #TestCase,
	#instVars : [
		'respuesta',
		'pastorsin',
		'creacionPublicacion',
		'skydler'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #'private-initialize' }
RespuestaTest >> initializeFollowers [
	pastorsin agregarFollower: skydler
]

{ #category : #'private-initialize' }
RespuestaTest >> initializeRespuestas [
	respuesta := Respuesta newTexto: 'x' usuario: pastorsin.
	creacionPublicacion := DateAndTime now
]

{ #category : #'private-initialize' }
RespuestaTest >> initializeUsuarios [
	pastorsin := Usuario newNombre: 'pastorsin' contrasena: 'y'.
	skydler := Usuario newNombre: 'skydler' contrasena: 'x'
]

{ #category : #running }
RespuestaTest >> setUp [
	self initializeUsuarios.
	self initializeRespuestas.
	self initializeFollowers
]

{ #category : #'tests-likes' }
RespuestaTest >> testCantidadDeDislikes [
	self assert: respuesta cantidadDeDislikes equals: 0.
]

{ #category : #'tests-likes' }
RespuestaTest >> testCantidadDeLikes [
	self assert: respuesta cantidadDeLikes equals: 0.
]

{ #category : #'tests-constructor' }
RespuestaTest >> testConstructor [
	self assert: (respuesta tuCreadorEs: pastorsin).
	self assert: respuesta texto equals: 'x'.
	self assert: respuesta cantidadDeLikes equals: 0.
	self assert: respuesta cantidadDeDislikes equals: 0.
	self assert: respuesta fechaDeCreacion equals: creacionPublicacion asDate.
	self assert: respuesta horaDeCreacion hour equals: creacionPublicacion asTime hour.
	self assert: respuesta horaDeCreacion minutes equals: creacionPublicacion asTime minutes.
]

{ #category : #'tests-creacion' }
RespuestaTest >> testFechaDeCreacion [
	self assert: respuesta fechaDeCreacion equals: creacionPublicacion asDate.
]

{ #category : #'tests-creacion' }
RespuestaTest >> testHoraDeCreacion [
	self assert: respuesta horaDeCreacion hour equals: creacionPublicacion asTime hour.
	self assert: respuesta horaDeCreacion minutes equals: creacionPublicacion asTime minutes.
]

{ #category : #'tests-likes' }
RespuestaTest >> testRegistrarDislikeDe [
	"Compruebo el switch entre el like y dislike"
	respuesta registrarLikeDe: skydler.
	respuesta registrarDislikeDe: skydler.
	self assert: respuesta cantidadDeDislikes equals: 1.
	self assert: respuesta cantidadDeLikes equals: 0.
	"Compruebo que si el mismo usuario vuelve a dar dislike no se contabilice..."
	respuesta registrarDislikeDe: skydler.
	self assert: respuesta cantidadDeDislikes equals: 1.
	"...pero si lo hace uno diferente sí"
	respuesta registrarDislikeDe: pastorsin.
	self assert: respuesta cantidadDeDislikes equals: 2.
]

{ #category : #'tests-likes' }
RespuestaTest >> testRegistrarLikeDe [
	"Compruebo el switch entre el like y dislike"
	respuesta registrarDislikeDe: skydler.
	respuesta registrarLikeDe: skydler.
	self assert: respuesta cantidadDeLikes equals: 1.
	self assert: respuesta cantidadDeDislikes equals: 0.
	"Compruebo que si el mismo usuario vuelve a dar like no se contabilice..."
	respuesta registrarLikeDe: skydler.
	self assert: respuesta cantidadDeLikes equals: 1.
	"...pero si lo hace uno diferente sí"
	respuesta registrarLikeDe: pastorsin.
	self assert: respuesta cantidadDeLikes equals: 2.
]

{ #category : #'tests-comparing' }
RespuestaTest >> testTuCreadorEs [
	self assert: (respuesta tuCreadorEs: pastorsin).
	self deny: (respuesta tuCreadorEs: skydler)
]

{ #category : #'tests-comparing' }
RespuestaTest >> testTuCreadorEsSeguidoPor [
	self assert: (respuesta tuCreadorEsSeguidoPor: skydler).
	self deny: (respuesta tuCreadorEsSeguidoPor: pastorsin)
]
