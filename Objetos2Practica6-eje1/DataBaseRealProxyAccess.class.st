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
DataBaseRealProxyAccess >> getSearchResults: queryString [
	autenticador isLogin ifTrue: [ ^ databases getSearchResults: queryString ].
	 ^ false.
]

{ #category : #'as yet unclassified' }
DataBaseRealProxyAccess >> inicializarAutenticador: aAutenticator database: aDataBase [

	autenticador := aAutenticator. 
	databases := aDataBase.
]

{ #category : #'as yet unclassified' }
DataBaseRealProxyAccess >> insertNewRow: aString [

	autenticador isLogin ifTrue: [ ^ databases insertNewRow: aString  ].
	
	^ false.
]
