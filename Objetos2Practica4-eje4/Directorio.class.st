Class {
	#name : #Directorio,
	#superclass : #FileSistem,
	#instVars : [
		'directorios'
	],
	#category : #'Objetos2Practica4-eje4'
}

{ #category : #queries }
Directorio >> agregar: aFile. [
	directorios add: aFile

]

{ #category : #queries }
Directorio >> archivoMasGrande [
	|resultado|
	resultado:= (directorios collect:[:c | c archivoMasGrande]) reject:[:e | e isNil].
	resultado isEmpty ifTrue: [ ^nil ].
	^ resultado detectMax: [ :e|e tamano ]
]

{ #category : #queries }
Directorio >> archivoMasNuevo [
	|resultado|
	resultado:= (directorios collect:[:c | c archivoMasNuevo]) reject:[:e | e isNil].
	resultado isEmpty ifTrue: [ ^nil ].
	^ resultado detectMax: [ :e|e creado  ]
]

{ #category : #initialize }
Directorio >> initialize [ 

 directorios := OrderedCollection new.
]

{ #category : #queries }
Directorio >> listadoDeContenido [
^ self
]

{ #category : #queries }
Directorio >> tamano [
"(directorios sumNumbers:[:d| d tamano]) + 32000"
^  directorios inject: 32000 into: [ :sum :directorio| sum + directorio tamano  ]
]
