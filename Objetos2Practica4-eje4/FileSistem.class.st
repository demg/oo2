Class {
	#name : #FileSistem,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'tamano',
		'creado'
	],
	#category : #'Objetos2Practica4-eje4'
}

{ #category : #creacion }
FileSistem class >> llamado: aNombre creadoEl: aToday [
	^ self new llamado: aNombre creadoEl: aToday.
]

{ #category : #accessing }
FileSistem >> creado [
	^ creado
]

{ #category : #initalize }
FileSistem >> initialize [ 

	tamano := 32.
]

{ #category : #initialize }
FileSistem >> llamado: aNombre creadoEl: aToday [
	self initialize.
	nombre := aNombre.
	creado := aToday.
]

{ #category : #accessing }
FileSistem >> tamano [
	^ tamano
]
