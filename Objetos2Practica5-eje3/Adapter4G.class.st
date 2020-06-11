Class {
	#name : #Adapter4G,
	#superclass : #Connection,
	#instVars : [
		'connect4G'
	],
	#category : #'Objetos2Practica5-eje3'
}

{ #category : #'as yet unclassified' }
Adapter4G class >> new: aConnect [

	^ self new initializeConnection:  aConnect
]

{ #category : #accessing }
Adapter4G >> initializeConnection: aConnection [

	connect4G := aConnection
]

{ #category : #printing }
Adapter4G >> symb [

	^ varTest := connect4G pict
]
