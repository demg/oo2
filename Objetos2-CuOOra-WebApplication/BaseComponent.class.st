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


    Implementation Points
"
Class {
	#name : #BaseComponent,
	#superclass : #WAComponent,
	#instVars : [
		'cuoora',
		'usuarioConectado'
	],
	#category : #'Objetos2-CuOOra-WebApplication'
}

{ #category : #'instance creation' }
BaseComponent class >> newCuoora: cuoora [
	^ self new cuoora: cuoora
]

{ #category : #callbacks }
BaseComponent >> contabilizarDislike: publicacion [
	cuoora registrarDislikeEnPublicacion: publicacion de: self usuarioConectado
]

{ #category : #callbacks }
BaseComponent >> contabilizarLike: publicacion [
	cuoora registrarLikeEnPublicacion: publicacion de: self usuarioConectado
]

{ #category : #initialization }
BaseComponent >> cuoora: unCuoora [
	cuoora := unCuoora.
]

{ #category : #callbacks }
BaseComponent >> logout [
	self show: (WelcomeComponent newCuoora: cuoora).
	self session logout.
]

{ #category : #callbacks }
BaseComponent >> mostrarDetalleDeUsuario: usuario [
	self
		show:
			(DetalleUsuarioComponent newCuoora: cuoora usuario: usuario)
]

{ #category : #'rendering-preguntas' }
BaseComponent >> render: html autorYrespuestas: pregunta [
	html paragraph: [ self render: html creadorPregunta: pregunta.
			html text: ' | '.
			self render: html cantRespuestas: pregunta ]
]

{ #category : #'rendering-preguntas' }
BaseComponent >> render: html cantRespuestas: pregunta [
	html text: (cuoora obtenerRespuestasDeLaPregunta: pregunta) size.
	html text: ' respuestas'
]

{ #category : #'rendering-preguntas' }
BaseComponent >> render: html creadorPregunta: pregunta [
	html text: 'Realizada por '.
	html anchor
		callback: [ self mostrarDetalleDeUsuario: pregunta creador ];
		with: [ html strong: pregunta nombreDeCreador ]
]

{ #category : #'rendering-preguntas' }
BaseComponent >> render: html likes: pregunta [
	self render: html mostradorDeLikes: pregunta.
	self render: html puntuadorDeLikes: pregunta
]

{ #category : #'rendering-preguntas' }
BaseComponent >> render: html mostradorDeLikes: publicacion [
	html
		paragraph:
			('{1} likes | {2} dislikes'
				format:
					{publicacion cantidadDeLikes.
					publicacion cantidadDeDislikes})
]

{ #category : #'rendering-preguntas' }
BaseComponent >> render: html pregunta: pregunta [
	self render: html tituloPregunta: pregunta.
	self render: html topicosDe: pregunta.
	self render: html autorYrespuestas: pregunta.
	self render: html likes: pregunta.
	html horizontalRule
]

{ #category : #'rendering-preguntas' }
BaseComponent >> render: html puntuadorDeLikes: publicacion [
	html anchor
		callback: [ self contabilizarLike: publicacion ];
		with: 'like'.
	html text: ' | '.
	html anchor
		callback: [ self contabilizarDislike: publicacion ];
		with: 'dislike'.
]

{ #category : #'rendering-preguntas' }
BaseComponent >> render: html textoTituloPregunta: unaPregunta [
	html big: [ html emphasis: unaPregunta titulo ]
]

{ #category : #'rendering-preguntas' }
BaseComponent >> render: html tituloPregunta: unaPregunta [
	self render: html textoTituloPregunta: unaPregunta
]

{ #category : #'rendering-preguntas' }
BaseComponent >> render: html topicosDe: pregunta [
	html
		paragraph: [ html emphasis: 'Topicos: '.
			html text: (', ' join: pregunta nombreDeTopicos) ]
]

{ #category : #rendering }
BaseComponent >> renderContentOn: html [
	self renderHeader: html
]

{ #category : #'rendering-header' }
BaseComponent >> renderHeader: html [
	html header
		with: [ self renderTituloHeader: html.
			self renderUsuarioConectadoHeader: html ].
	html horizontalRule
]

{ #category : #'rendering-header' }
BaseComponent >> renderTituloHeader: html [
	html heading level1 with: 'CuOOra'.
	html horizontalRule
]

{ #category : #'rendering-header' }
BaseComponent >> renderUsuarioConectadoHeader: html [
	html strong: self session user , ' '.
	html anchor
		callback: [ self logout ];
		with: 'Logout'
]

{ #category : #rendering }
BaseComponent >> renderVolver: html [
	html anchor callback: [ self answer ]; with: 'Volver'.
]

{ #category : #hooks }
BaseComponent >> style [
 ^ 'header, footer {text-align:center;}'
]

{ #category : #utility }
BaseComponent >> usuarioConectado [
	^ cuoora obtenerUsuario: (self session user)
]
