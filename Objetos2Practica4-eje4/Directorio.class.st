Class {
	#name : #Directorio,
	#superclass : #FileSistem,
	#instVars : [
		'directorios'
	],
	#category : #'Objetos2Practica4-eje4'
}

{ #category : #'instance creation' }
Directorio class >> new: aNombre [ 

^ self new initialize: aNombre  
]

{ #category : #'instance creation' }
Directorio class >> new: aNombre with: aCollection [

^ self new initialize: aNombre with: aCollection 
]

{ #category : #queries }
Directorio >> agregar: aFile. [
	directorios add: aFile

]

{ #category : #size }
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

{ #category : #'as yet unclassified' }
Directorio >> cantidadDeArchivos [

	^ directorios sumNumbers: [ :dir | dir contarComoArchivo  ]
]

{ #category : #'as yet unclassified' }
Directorio >> contarComoArchivo [
	^ 0
]

{ #category : #initialize }
Directorio >> initialize [ 

 directorios := OrderedCollection new.
]

{ #category : #initialize }
Directorio >> initialize: aNombre [ 
	nombre := aNombre.
 	self initialize .
]

{ #category : #initialize }
Directorio >> initialize: aNombre with: aCollection [
	nombre := aNombre.
	directorios := aCollection
]

{ #category : #queries }
Directorio >> listadoDeContenido [
| buffering |
	buffering := ''.
	^ (self listarDirectorios: buffering)
]

{ #category : #queries }
Directorio >> listarDirectorios: aPath [
	|cantArchivos buffering path |
	path := aPath , '/' , self nombre.
	buffering := path.
	cantArchivos := self cantidadDeArchivos.
	(cantArchivos > 0)ifTrue: [
		buffering := buffering,' (', cantArchivos printString , ' archivos)'].
	"buffering := buffering , Character cr asString."
	directorios
		do: [ :elemento | 
			buffering := buffering,( elemento
				listarDirectorios: path) ].
	^ buffering 
]

{ #category : #size }
Directorio >> tamano [
"(directorios sumNumbers:[:d| d tamano]) + 32000"
^  directorios inject: 32000 into: [ :sum :directorio| sum + directorio tamano  ]
]

{ #category : #size }
Directorio >> tamanoTotalOcupado [
	^ self tamano
]
