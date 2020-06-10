Class {
	#name : #BibliotecaTest,
	#superclass : #TestCase,
	#instVars : [
		'biblioteca',
		'socios',
		'export',
		'arya',
		'tyron',
		'expected_json',
		'expected_ston',
		'bibliotecaJson',
		'bibliotecaSton'
	],
	#category : #'Objetos2Practica4-eje-1-Biblioteca'
}

{ #category : #initialization }
BibliotecaTest >> initializeAgregarSocios [
	biblioteca agregarSocio: arya.
	biblioteca agregarSocio: tyron.
	
]

{ #category : #initialization }
BibliotecaTest >> initializeJsonSton [
	expected_json := '[{"legajo":"5234/5","email":"needle@stark.com","nombre":"Arya Stark"},{"legajo":"2345/2","email":"tyrion@thelannisters.com","nombre":"Tyrion Lannister"}]'.
	expected_ston := 'OrderedCollection [
	Socio {
		#nombre : ''Arya Stark'',
		#email : ''needle@stark.com'',
		#legajo : ''5234/5''
	},
	Socio {
		#nombre : ''Tyrion Lannister'',
		#email : ''tyrion@thelannisters.com'',
		#legajo : ''2345/2''
	}
]'
]

{ #category : #initialization }
BibliotecaTest >> initializeSocios [
	arya := Socio
		nombre: 'Arya Stark'
		email: 'needle@stark.com'
		legajo: '5234/5'.
	tyron := Socio
		nombre: 'Tyrion Lannister'
		email: 'tyrion@thelannisters.com'
		legajo: '2345/2'.

	
]

{ #category : #running }
BibliotecaTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	biblioteca := Biblioteca  new: AdapterJSon  new.
	bibliotecaJson := Biblioteca  new: AdapterJSon  new.
	bibliotecaSton := Biblioteca  new: AdapterJSon  new.
	self initializeSocios.
	self initializeAgregarSocios.
	self initializeJsonSton.
]

{ #category : #running }
BibliotecaTest >> testAgregarSocios [
	"CHEQUEDO Q LOS SOCIOS FUERON AGREGADOS A LA COLECCION"
	self assert: (biblioteca socios includes: tyron).
	self assert: (biblioteca socios includes: arya).

]

{ #category : #running }
BibliotecaTest >> testExportSocios [
	"CHEQUEDO Q LOS SOCIOS FUERON AGREGADOS A LA COLECCION"

	self assert: (biblioteca exportarSocios) equals: expected_json.
	
]
