Class {
	#name : #DataBaseRealProxyAccess,
	#superclass : #DatabaseAccess,
	#instVars : [
		'autenticador',
		'databases'
	],
	#category : #'Objetos2Practica6-eje1'
}

{ #category : #'instance creation' }
DataBaseRealProxyAccess class >> newWith: aAtutenticador with: aDataBase [
	^ self new inicializarAutenticador: aAtutenticador database: aDataBase
]

{ #category : #'as yet unclassified' }
DataBaseRealProxyAccess >> doesNotUnderstand: aMessage [
	autenticador isLogin
		ifTrue:
			[ ^ databases perform: (aMessage selector) withArguments: (aMessage arguments) ].
	^ false
]

{ #category : #'as yet unclassified' }
DataBaseRealProxyAccess >> inicializarAutenticador: aAutenticator database: aDataBase [

	autenticador := aAutenticator. 
	databases := aDataBase.
]
