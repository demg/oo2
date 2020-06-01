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
	advertencia:		<Object>
	contrasena:		<Object>
	nombre:		<Object>


    Implementation Points
"
Class {
	#name : #InnSession,
	#superclass : #WASession,
	#instVars : [
		'user',
		'password'
	],
	#category : #'Objetos2-CuOOra-WebApplication'
}

{ #category : #initialization }
InnSession >> initialize [
	super initialize.
]

{ #category : #testing }
InnSession >> isLoggedIn [
	^ user isNotNil
]

{ #category : #protocol }
InnSession >> loginUser: anUser password: aPass [
	user := anUser.
	password := aPass.	

]

{ #category : #callbacks }
InnSession >> logout [
	user := nil.
	password := nil
]

{ #category : #accessing }
InnSession >> password [
	^ password
]

{ #category : #accessing }
InnSession >> user [
	^ user
]
