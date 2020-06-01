Class {
	#name : #Topografia2,
	#superclass : #Object,
	#instVars : [
		'superficies'
	],
	#category : #Objetos2Practica2
}

{ #category : #'as yet unclassified' }
Topografia2 class >> newTopografia: p1 parte2: p2 parte3: p3 parte4: p4 [



^(self new 
	superficies:  OrderedCollection new; 
	parte1: p1 parte2: p2 parte3:  p3 parte4: p4 ).

]

{ #category : #'as yet unclassified' }
Topografia2 >> = unaTopografia [

"((self proporcion) = (unaTopografia proporcion))ifTrue: [ ^true ];
ifFalse: [ ^false ]."
]

{ #category : #'as yet unclassified' }
Topografia2 >> parte1:p1 parte2: p2 parte3: p3 parte4: p4 [

self superficies add: p1; add: p2; add: p3; add: p4.
]

{ #category : #'as yet unclassified' }
Topografia2 >> proporcion [
	"comment stating purpose of message"

^self superficies inject: 0
		into: [:total :compo | total + (compo proporcion  / 4) ]
]

{ #category : #accessing }
Topografia2 >> superficies [
	^ superficies
]

{ #category : #accessing }
Topografia2 >> superficies: anObject [
	superficies := anObject
]
