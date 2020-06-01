Class {
	#name : #Archivo,
	#superclass : #FileSistem,
	#category : #'Objetos2Practica4-eje4'
}

{ #category : #creacion }
Archivo class >> llamado: aName creadoEl: aToday kBytes: aKBytes [
  ^ self new llamado: aName creadoEl:aToday kBytes:aKBytes
]

{ #category : #'as yet unclassified' }
Archivo >> archivoMasGrande [ 
	^ self
]

{ #category : #'as yet unclassified' }
Archivo >> archivoMasNuevo [ 
	^ self
]

{ #category : #creacion }
Archivo >> llamado: aName creadoEl: aToday kBytes:aKBytes [
	self llamado:aName  creadoEl: aToday.
	tamano := aKBytes .

]
