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
	#name : #HomeBrowserComponent,
	#superclass : #BaseComponent,
	#category : #'Objetos2-CuOOra-WebApplication'
}

{ #category : #callbacks }
HomeBrowserComponent >> mostrarAgregarPregunta [
	^ self show: (AgregarPreguntaComponent newCuoora: cuoora)
]

{ #category : #callbacks }
HomeBrowserComponent >> mostrarDetalle: unaPregunta [
	self
		show: (DetallePreguntasComponent newCuoora: cuoora pregunta: unaPregunta)
]

{ #category : #rendering }
HomeBrowserComponent >> render: html tituloPregunta: pregunta [
	html anchor
		callback: [ self mostrarDetalle: pregunta ];
		with: [ self render: html textoTituloPregunta: pregunta ]
]

{ #category : #rendering }
HomeBrowserComponent >> renderAgregarPregunta: html [
	html anchor
		callback: [ self mostrarAgregarPregunta ];
		with: [ html heading level3 with: '+ Nueva pregunta' ].
	html horizontalRule
]

{ #category : #rendering }
HomeBrowserComponent >> renderContentOn: html [
	super renderContentOn: html.
	self renderAgregarPregunta: html.
	self renderUltimasPreguntas: html.
]

{ #category : #rendering }
HomeBrowserComponent >> renderListaDePreguntas: html [
	html unorderedList: [ self renderPreguntasRelevantes: html. ]
]

{ #category : #rendering }
HomeBrowserComponent >> renderPreguntasRelevantes: html [
	| preguntasRelevantes |
	preguntasRelevantes := (cuoora obtenerPreguntasRelevantesOrdenadasPorFecha: self usuarioConectado)
		takeFirst: 5.
	preguntasRelevantes do: [ :pregunta | html listItem: [ self render: html pregunta: pregunta ] ]
]

{ #category : #rendering }
HomeBrowserComponent >> renderUltimasPreguntas: html [
	html heading: 'Últimas preguntas'.
	self renderListaDePreguntas: html
]
