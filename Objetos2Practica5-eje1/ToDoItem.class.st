Class {
	#name : #ToDoItem,
	#superclass : #Object,
	#instVars : [
		'status'
	],
	#category : #'Objetos2Practica5-eje1'
}

{ #category : #accessing }
ToDoItem class >> name: aName [

 	^ self new status: Pending newCon: aName. 
]

{ #category : #'changing state' }
ToDoItem >> finish [  

	status finish.
]

{ #category : #'changing state' }
ToDoItem >> start [ 

	status start.
]

{ #category : #accessing }
ToDoItem >> status [
	^ status
]

{ #category : #accessing }
ToDoItem >> status: anObject [
	status := anObject
]

{ #category : #'changing state' }
ToDoItem >> togglePause [  

	status togglePause.
]

{ #category : #'changing state' }
ToDoItem >> workedTime [   
"retorna el tiempo transcurrido desde q se inicio hasta q finalizo. En caso q no este finalizada, hasta
el actual. Si la tarea no inicio  genera error informando el error"
	status ifNil: [ ^self error: 'Estado no instanciado' ].
	^ status workedTime .
]
