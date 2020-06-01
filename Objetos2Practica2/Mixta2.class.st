Class {
	#name : #Mixta2,
	#superclass : #Topografia2,
	#category : #Objetos2Practica2
}

{ #category : #'as yet unclassified' }
Mixta2 class >> newMixta: p1 parte2: p2 parte3: p3 parte4: p4 [



^super new
	
	parte1: p1 parte2: p2 parte3:  p3 parte4: p4 .

 
]

{ #category : #accessing }
Mixta2 >> proporcion [
	^ super proporcion
]

{ #category : #accessing }
Mixta2 >> superficies [
	^ superficies
]

{ #category : #accessing }
Mixta2 >> superficies: anObject [
	superficies := anObject
]
