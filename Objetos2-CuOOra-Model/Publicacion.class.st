"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	creacion:		<Object>
	creador:		<Object>
	dislikes:		<Object>
	likes:		<Object>


    Implementation Points
"
Class {
	#name : #Publicacion,
	#superclass : #Object,
	#instVars : [
		'creacion',
		'puntuaciones',
		'creador'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'instance creation' }
Publicacion class >> newCreador: usuario [
	^ self new creador: usuario
]

{ #category : #creacion }
Publicacion >> calcularDiferenciaLikes [
	^ self cantidadDeLikes - self cantidadDeDislikes
]

{ #category : #likes }
Publicacion >> cantidadDeDislikes [
	^ (puntuaciones reject: [ :puntuacion | puntuacion esLike ]) size
]

{ #category : #likes }
Publicacion >> cantidadDeLikes [
	^ (puntuaciones select: [ :puntuacion | puntuacion esLike ]) size
]

{ #category : #accessing }
Publicacion >> creador [
	^ creador
]

{ #category : #initialization }
Publicacion >> creador: usuario [
	creador := usuario 
]

{ #category : #creacion }
Publicacion >> fechaDeCreacion [
	^ creacion asDate
]

{ #category : #creacion }
Publicacion >> horaDeCreacion [
	^ creacion asTime
]

{ #category : #initialization }
Publicacion >> initialize [
	creacion := DateAndTime now.
	puntuaciones := OrderedCollection new
]

{ #category : #creacion }
Publicacion >> nombreDeCreador [
	^ creador nombre 
]

{ #category : #likes }
Publicacion >> registrarDislikeDe: usuario [
	self registrarPuntuacion: (Dislike newPuntuador: usuario) de: usuario
]

{ #category : #likes }
Publicacion >> registrarLikeDe: usuario [
	self registrarPuntuacion: (Like newPuntuador: usuario) de: usuario.
]

{ #category : #private }
Publicacion >> registrarPuntuacion: unaPuntuacion de: usuario [
	puntuaciones removeAllSuchThat: [ :puntuacion | puntuacion tuPuntuadorEs: usuario ].
	puntuaciones add: unaPuntuacion
]

{ #category : #query }
Publicacion >> tuCreadorEs: usuario [
	^ creador sosIgualA: usuario
]

{ #category : #query }
Publicacion >> tuCreadorEsSeguidoPor: otroUsuario [
	^ creador teSigue: otroUsuario
	
]
