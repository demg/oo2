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
	pregunta:		<Object>
	texto:		<Object>


    Implementation Points
"
Class {
	#name : #AgregarRespuestaComponent,
	#superclass : #BaseComponent,
	#instVars : [
		'pregunta',
		'texto'
	],
	#category : #'Objetos2-CuOOra-WebApplication'
}

{ #category : #'instance creation' }
AgregarRespuestaComponent class >> newCuoora: cuoora pregunta: pregunta [
	^ (self new cuoora: cuoora) pregunta: pregunta
]

{ #category : #callbacks }
AgregarRespuestaComponent >> cancelar [
	self answer
]

{ #category : #callbacks }
AgregarRespuestaComponent >> guardar [
	texto
		ifNotEmpty:
			[ cuoora agregarRespuestaConTexto: texto usuario: self usuarioConectado enPregunta: pregunta ].
	self answer
]

{ #category : #initialization }
AgregarRespuestaComponent >> pregunta: unaPregunta [
	pregunta := unaPregunta.

]

{ #category : #rendering }
AgregarRespuestaComponent >> renderButtons: html [
	html submitButton
		callback: [ self guardar ];
		value: 'Guardar'.
	html submitButton
		callback: [ self cancelar ];
		value: 'Cancelar'
]

{ #category : #rendering }
AgregarRespuestaComponent >> renderContentOn: html [
	super renderContentOn: html.
	self render: html pregunta: pregunta.
	self renderForm: html
]

{ #category : #rendering }
AgregarRespuestaComponent >> renderForm: html [
	html
		form: [ self renderRespuesta: html.
			self renderButtons: html ]
]

{ #category : #rendering }
AgregarRespuestaComponent >> renderRespuesta: html [
	html paragraph: [ html heading level3 with: 'RESPONDER' ].
	html textArea
		rows: 7;
		columns: 100;
		placeholder: 'Escriba aquí el texto de su respuesta';
		on: #texto of: self.
	html break
]

{ #category : #accessing }
AgregarRespuestaComponent >> texto [
	^ texto
]

{ #category : #accessing }
AgregarRespuestaComponent >> texto: unTexto [
	texto := unTexto
]
