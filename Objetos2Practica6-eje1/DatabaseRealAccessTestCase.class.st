Class {
	#name : #DatabaseRealAccessTestCase,
	#superclass : #TestCase,
	#instVars : [
		'database',
		'autenticador',
		'databaseProxy',
		'autenticadorIsTrue',
		'autenticadorIsFalse',
		'databaseProxyFalse'
	],
	#category : #'Objetos2Practica6-eje1'
}

{ #category : #running }
DatabaseRealAccessTestCase >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	database:= DatabaseRealAcess new.
	autenticadorIsTrue:= Autenticador  new initializeLogin: true.
	autenticadorIsFalse:= Autenticador  new initializeLogin: false.
	databaseProxy:= DataBaseRealProxyAccess  newWith: autenticadorIsTrue with: database .
	databaseProxyFalse:= DataBaseRealProxyAccess  newWith: autenticadorIsFalse with: database .
]

{ #category : #tests }
DatabaseRealAccessTestCase >> testGetSearchResults [
	"comment stating purpose of message"

self assert:((database getSearchResults: 'select * from comics where id=1') = #('Spiderman' 'Marvel')).

self assert:((database getSearchResults: 'select * from comics where id=10') = #()).
]

{ #category : #tests }
DatabaseRealAccessTestCase >> testGetSearchResultsProxy [
	"comment stating purpose of message"

self assert:((databaseProxy getSearchResults: 'select * from comics where id=1') = #('Spiderman' 'Marvel')).

self assert:((databaseProxy getSearchResults: 'select * from comics where id=10') = #()).


self assert:((databaseProxyFalse  getSearchResults: 'select * from comics where id=1') = #('Spiderman' 'Marvel')) equals: false.

self assert:((databaseProxyFalse getSearchResults: 'select * from comics where id=10') = #())equals: false.
]

{ #category : #tests }
DatabaseRealAccessTestCase >> testInsertNewRow [
	"comment stating purpose of message"
	|rowData|
	rowData:= #('Paturuzu' 'La flor').
 self assert: ((database insertNewRow: rowData) == 3).
 self assert:((database getSearchResults: 'select * from comics where id=3') = rowData).
]

{ #category : #tests }
DatabaseRealAccessTestCase >> testInsertNewRowProxy [
	"comment stating purpose of message"
	|rowData|
	rowData:= #('Paturuzu' 'La flor').
 self assert: ((databaseProxy insertNewRow: rowData) == 3).
 self assert:((databaseProxy getSearchResults: 'select * from comics where id=3') = rowData).

 self assert:  ((databaseProxyFalse insertNewRow: rowData) == 3) equals: false.
 self assert: ((databaseProxyFalse getSearchResults: 'select * from comics where id=3') = rowData)  equals: false.
]
