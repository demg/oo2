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
	contrasena:		<Object>
	creacion:		<Object>
	followers:		<Object>
	nombre:		<Object>
	topicosDeInteres:		<Object>


    Implementation Points
"
Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'contrasena',
		'creacion',
		'followers',
		'topicosDeInteres'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'instance creation' }
Usuario class >> newNombre: nombre contrasena: contrasena [
	^ self new nombre: nombre contrasena: contrasena
]

{ #category : #followers }
Usuario >> agregarFollower: follower [
	followers add: follower
]

{ #category : #topicos }
Usuario >> agregarTopicoDeInteres: topico [
	topicosDeInteres add: topico
]

{ #category : #creacion }
Usuario >> fechaDeCreacion [
	^ creacion asDate
]

{ #category : #accessing }
Usuario >> followers [
	^ followers
]

{ #category : #creacion }
Usuario >> horaDeCreacion [
	^ creacion asTime
]

{ #category : #initialization }
Usuario >> initialize [
	followers := Set new.
	topicosDeInteres := OrderedCollection new.
	creacion := DateAndTime now
]

{ #category : #accessing }
Usuario >> nombre [
	^ nombre
]

{ #category : #initialization }
Usuario >> nombre: unNombre contrasena: unaContrasena [
	nombre := unNombre.
	contrasena := unaContrasena
]

{ #category : #comparing }
Usuario >> sosIgualA: otroUsuario [
	^ self tuNombreEs: (otroUsuario nombre)
	
]

{ #category : #comparing }
Usuario >> teInteresaEstaPregunta: pregunta [
	^ topicosDeInteres anySatisfy: [ :topico | pregunta algunoDeTusTopicoEs: topico ]
]

{ #category : #comparing }
Usuario >> teSigue: otroUsuario [
	^ followers anySatisfy: [ :follower | follower sosIgualA: otroUsuario ]
]

{ #category : #accessing }
Usuario >> topicosDeInteres [
	^ topicosDeInteres
]

{ #category : #comparing }
Usuario >> tuContrasenaEs: unaContrasena [
	^ unaContrasena = contrasena
]

{ #category : #comparing }
Usuario >> tuNombreEs: unNombre [
	^ self nombre = unNombre
]
