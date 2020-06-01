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
	descripcion:		<Object>
	titulo:		<Object>
	topicos:		<Object>


    Implementation Points
"
Class {
	#name : #AgregarPreguntaComponent,
	#superclass : #BaseComponent,
	#instVars : [
		'titulo',
		'descripcion',
		'topicos'
	],
	#category : #'Objetos2-CuOOra-WebApplication'
}

{ #category : #callbacks }
AgregarPreguntaComponent >> cancelar [
	self answer
]

{ #category : #accessing }
AgregarPreguntaComponent >> descripcion [
	^ descripcion
]

{ #category : #accessing }
AgregarPreguntaComponent >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #callbacks }
AgregarPreguntaComponent >> guardar [
	self noHayCamposVacios
		ifTrue: [ cuoora
				agregarPreguntaConTitulo: titulo
				descripcion: descripcion
				topicos: self parsearTopicos
				usuario: self usuarioConectado ].
	self answer
]

{ #category : #private }
AgregarPreguntaComponent >> noHayCamposVacios [
	^ titulo isNotEmpty & descripcion isNotEmpty & topicos isNotEmpty
]

{ #category : #private }
AgregarPreguntaComponent >> parsearTopicos [
	^ (topicos splitOn: ', ') collect: [ :nombreTopico | self retornarTopico: nombreTopico ]
]

{ #category : #rendering }
AgregarPreguntaComponent >> renderButtons: html [
	html submitButton
		callback: [ self cancelar ];
		value: 'Cancelar'.
	html submitButton
		callback: [ self guardar ];
		value: 'Guardar'
]

{ #category : #rendering }
AgregarPreguntaComponent >> renderContentOn: html [
	super renderContentOn: html.
	self renderForm: html
]

{ #category : #rendering }
AgregarPreguntaComponent >> renderDesarrollo: html [
	html paragraph: 'Desarrollo: '.
	html textArea
		on: #descripcion of: self;
		placeholder: 'Escriba aquí el desarrollo de su pregunta.';
		rows: 15;
		columns: 95
]

{ #category : #rendering }
AgregarPreguntaComponent >> renderForm: html [
	html
		form: [ self renderTitulo: html.
			self renderDesarrollo: html.
			self renderTopicos: html.
			html horizontalRule.
			self renderButtons: html ]
]

{ #category : #rendering }
AgregarPreguntaComponent >> renderTitulo: html [
	html paragraph: 'Título: '.
	html textInput
		on: #titulo of: self;
		placeholder: 'Escriba aquí el título de su pregunta.';
		size: 95
]

{ #category : #rendering }
AgregarPreguntaComponent >> renderTopicos: html [
	html paragraph: 'Tópicos: '.
	html textInput
		on: #topicos of: self;
		placeholder: 'Ingrese tópicos separado por coma.';
		size: 95
]

{ #category : #private }
AgregarPreguntaComponent >> retornarTopico: nombreTopico [
	^ (cuoora existeTopico: nombreTopico)
		ifTrue: [ cuoora obtenerTopico: nombreTopico ]
		ifFalse: [ cuoora agregarTopicoConNombre: nombreTopico descripcion: '' ]
]

{ #category : #accessing }
AgregarPreguntaComponent >> titulo [
	^ titulo
]

{ #category : #accessing }
AgregarPreguntaComponent >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
AgregarPreguntaComponent >> topicos [
	^ topicos
]

{ #category : #accessing }
AgregarPreguntaComponent >> topicos: anObject [
	topicos := anObject
]
