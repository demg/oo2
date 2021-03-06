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
	nombre:		<Object>


    Implementation Points
"
Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'instance creation' }
Topico class >> newNombre: nombre descripcion: descripcion [
	^ self new nombre: nombre descripcion: descripcion
]

{ #category : #accessing }
Topico >> descripcion [
	^ descripcion 
]

{ #category : #accessing }
Topico >> nombre [
	^ nombre
]

{ #category : #initialization }
Topico >> nombre: unNombre descripcion: unaDescripcion [
	nombre := unNombre.
	descripcion := unaDescripcion 
]

{ #category : #query }
Topico >> sosIgualA: otroTopico [
	^ self nombre = otroTopico nombre
]

{ #category : #query }
Topico >> tuNombreEs: otroNombre [
	^ nombre = otroNombre
]
