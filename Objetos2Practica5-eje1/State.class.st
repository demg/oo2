Class {
	#name : #State,
	#superclass : #Object,
	#instVars : [
		'status',
		'nombre',
		'timer'
	],
	#category : #'Objetos2Practica5-eje1'
}

{ #category : #'instance creation' }
State class >> newCon: aName [

	^ self new initialize: aName.
]

{ #category : #initialization }
State >> initialize: aName [
	self initialize.
	nombre := aName.
	timer := Time totalSeconds.
	Duration new
]

{ #category : #accessing }
State >> start [
	^ self
]

{ #category : #accessing }
State >> status: anObject [
	status := anObject
]

{ #category : #accessing }
State >> timer [
	^ timer
]

{ #category : #accessing }
State >> togglePause [
	^ self
]

{ #category : #'changing state' }
State >> workedTime [
	"debe retornar el inicio y el actual. "

	^ timer
]
