Class {
	#name : #Autenticador,
	#superclass : #Object,
	#instVars : [
		'logged'
	],
	#category : #'Objetos2Practica6-eje1'
}

{ #category : #initialization }
Autenticador >> initializeLogin: aTrue [
	logged := aTrue.
]

{ #category : #testing }
Autenticador >> isLogin [
	^ logged 
]
