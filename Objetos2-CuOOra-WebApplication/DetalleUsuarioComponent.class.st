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
	usuario:		<Object>


    Implementation Points
"
Class {
	#name : #DetalleUsuarioComponent,
	#superclass : #BaseComponent,
	#instVars : [
		'usuario'
	],
	#category : #'Objetos2-CuOOra-WebApplication'
}

{ #category : #'instance creation' }
DetalleUsuarioComponent class >> newCuoora: cuoora usuario: usuario [
	^ (self new cuoora: cuoora) usuario: usuario
]

{ #category : #rendering }
DetalleUsuarioComponent >> renderContentOn: html [
	super renderContentOn: html.
	self renderListaDePreguntas: html.
	html horizontalRule.
	self renderVolver: html 
]

{ #category : #rendering }
DetalleUsuarioComponent >> renderFollow: html [
	html anchor
		callback: [ self seguirUsuario ];
		with: 'Follow'
]

{ #category : #rendering }
DetalleUsuarioComponent >> renderListaDePreguntas: html [
	self renderTituloListaDePreguntas: html.
	html unorderedList: [ self renderPreguntasDelUsuario: html ]
]

{ #category : #rendering }
DetalleUsuarioComponent >> renderPreguntasDelUsuario: html [
	(cuoora obtenerPreguntasDelUsuario: usuario) do: [ :pregunta | html listItem: [ self render: html pregunta: pregunta ] ]
]

{ #category : #rendering }
DetalleUsuarioComponent >> renderTituloListaDePreguntas: html [
	html heading level3
		with: [ html text: 'Preguntas de ' , usuario nombre , ' | '. self renderFollow: html ]
]

{ #category : #callbacks }
DetalleUsuarioComponent >> seguirUsuario [
	cuoora agregarFollower: self usuarioConectado a: usuario.
]

{ #category : #initialization }
DetalleUsuarioComponent >> usuario: unUsuario [
	usuario := unUsuario
]
