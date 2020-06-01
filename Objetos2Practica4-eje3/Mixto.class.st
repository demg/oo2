Class {
	#name : #Mixto,
	#superclass : #Topografia,
	#instVars : [
		'proporciones'
	],
	#category : #'Objetos2Practica4-eje3-Objetos2Practica4-eje3'
}

{ #category : #'as yet unclassified' }
Mixto class >> con: topo1 con: topo2 con: topo3 con: topo4 [
	^ self new
		proporciones: 
			(OrderedCollection
				with: topo1
				with: topo2
				with: topo3
				with: topo4)
]

{ #category : #accessing }
Mixto >> = aTopografia [
	^ aTopografia compararContraMixta: self 
"	^ ( proporciones collect: [ :each | each proporcion ])
		= (aSuperficies superficies collect: [ :each | each proporcion ])"
]

{ #category : #accessing }
Mixto >> compararContraMixta: aSuperficies [
	^ proporciones = aSuperficies proporciones
]

{ #category : #accessing }
Mixto >> proporcion [
	^ (proporciones   inject: 0 into: [ :sum :sup | sum + sup proporcion ])
		/ 4
]

{ #category : #accessing }
Mixto >> proporciones [
	^ proporciones
]

{ #category : #accessing }
Mixto >> proporciones: aCollect [
	proporciones := aCollect
	
]
