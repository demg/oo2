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
	respuestas:		<Object>
	titulo:		<Object>
	topicos:		<Object>


    Implementation Points
"
Class {
	#name : #Pregunta,
	#superclass : #Publicacion,
	#instVars : [
		'titulo',
		'descripcion',
		'topicos',
		'respuestas'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'instance creation' }
Pregunta class >> newTitulo: titulo descripcion: descripcion topicos: topicos usuario: usuario [
	^ (self newCreador: usuario) titulo: titulo descripcion: descripcion topicos: topicos
]

{ #category : #respuestas }
Pregunta >> agregarRespuestaConTexto: texto usuario: usuario [
	| nuevaRespuesta |
	nuevaRespuesta := Respuesta newTexto: texto usuario: usuario.
	respuestas add: nuevaRespuesta.
	^ nuevaRespuesta
]

{ #category : #query }
Pregunta >> algunoDeTusTopicoEs: unTopico [
	^ topicos anySatisfy: [ :topico | topico sosIgualA: unTopico ]
	
]

{ #category : #respuestas }
Pregunta >> dameLasRespuestasDel: usuario [
	^ respuestas select: [ :respuesta | respuesta tuCreadorEs: usuario ]
]

{ #category : #accessing }
Pregunta >> descripcion [
	^ descripcion
]

{ #category : #removing }
Pregunta >> eliminar [
	respuestas removeAll
]

{ #category : #initialization }
Pregunta >> initialize [
	super initialize.
	respuestas := OrderedCollection new
]

{ #category : #query }
Pregunta >> nombreDeTopicos [
	^ topicos collect: [ :topico | topico nombre ]
]

{ #category : #respuestas }
Pregunta >> obtenerRespuestasOrdenadas [
	^ respuestas sort: [ :respuesta1 :respuesta2 | respuesta1 cantidadDeLikes > respuesta2 cantidadDeLikes ]
]

{ #category : #accessing }
Pregunta >> titulo [
	^ titulo
]

{ #category : #initialization }
Pregunta >> titulo: unTitulo descripcion: unaDescripcion topicos: unosTopicos [
	titulo := unTitulo.
	descripcion := unaDescripcion.
	topicos := unosTopicos.
]
