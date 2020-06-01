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
	#name : #DetallePreguntasComponent,
	#superclass : #BaseComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-CuOOra-WebApplication'
}

{ #category : #'instance creation' }
DetallePreguntasComponent class >> newCuoora: cuoora pregunta: unaPregunta [
	^ (self new cuoora: cuoora) pregunta: unaPregunta
]

{ #category : #callbacks }
DetallePreguntasComponent >> mostrarAgregarRespuesta [
	self
		show: (AgregarRespuestaComponent newCuoora: cuoora pregunta: pregunta)
]

{ #category : #initialization }
DetallePreguntasComponent >> pregunta: unaPregunta [
	pregunta := unaPregunta.
]

{ #category : #rendering }
DetallePreguntasComponent >> render: html respuesta: respuesta [
	self render: html tituloRespuesta: respuesta.
	self render: html textoRespuesta: respuesta.
	self render: html likes: respuesta.
	html horizontalRule
]

{ #category : #rendering }
DetallePreguntasComponent >> render: html textoRespuesta: respuesta [
	html paragraph: respuesta texto
]

{ #category : #rendering }
DetallePreguntasComponent >> render: html tituloRespuesta: respuesta [
	html
		big: [ html
				strong: [ html
						emphasis: [ html text: 'Respuesta de ' , respuesta nombreDeCreador ] ] ]
]

{ #category : #rendering }
DetallePreguntasComponent >> renderAgregarRespuesta: html [
	html anchor
		callback: [ self mostrarAgregarRespuesta ];
		with: [ html heading level3 with: '+ Agregar respuesta' ]
		
]

{ #category : #rendering }
DetallePreguntasComponent >> renderContentOn: html [
	super renderContentOn: html.
	self render: html pregunta: pregunta.
	self renderListaDeRespuestas: html.
	self renderFooter: html
]

{ #category : #rendering }
DetallePreguntasComponent >> renderFinDeRespuestas: html [
	html emphasis: 'No hay más respuestas'
]

{ #category : #rendering }
DetallePreguntasComponent >> renderFooter: html [
	html
		footer: [ self renderFinDeRespuestas: html.
			html horizontalRule.
			self renderAgregarRespuesta: html.
			html horizontalRule.
			self renderVolver: html ]
]

{ #category : #rendering }
DetallePreguntasComponent >> renderListaDeRespuestas: html [
	| respuestas |
	respuestas := cuoora obtenerRespuestasDeLaPregunta: pregunta. 
	html unorderedList: [ respuestas do: [ :respuesta | html listItem: [ self render: html respuesta: respuesta ] ] ]
]
