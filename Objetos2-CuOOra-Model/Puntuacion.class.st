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
	like:		<Object>


    Implementation Points
"
Class {
	#name : #Puntuacion,
	#superclass : #Object,
	#instVars : [
		'creacion',
		'puntuador'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #accessing }
Puntuacion class >> newPuntuador: puntuador [
	^ self new puntuador: puntuador 
]

{ #category : #hooks }
Puntuacion >> esLike [
	self subclassResponsibility
]

{ #category : #creacion }
Puntuacion >> fechaDeCreacion [
	^ creacion asDate
]

{ #category : #creacion }
Puntuacion >> horaDeCreacion [
	^ creacion asTime
]

{ #category : #initialization }
Puntuacion >> initialize [
	creacion := DateAndTime now
]

{ #category : #initialization }
Puntuacion >> puntuador: unPuntuador [
	puntuador := unPuntuador.
	
]

{ #category : #comparing }
Puntuacion >> tuPuntuadorEs: otroPuntuador [
	^ puntuador sosIgualA: otroPuntuador
]
