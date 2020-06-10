Class {
	#name : #AdapterJSon,
	#superclass : #VoorheesExporter,
	#category : #'Objetos2Practica4-eje-1-Biblioteca'
}

{ #category : #access }
AdapterJSon >> crearDiccionario: aCollection [
	| col dic |
	col := OrderedCollection new.
	dic := Dictionary new.
	aCollection
		do: [ :each | 
			col
				add:
					(Dictionary
						newFrom:
							{(#nombre -> each nombre).
							(#email -> each email).
							(#legajo -> each legajo)}) ].

	^ col
]

{ #category : #access }
AdapterJSon >> export: aCollection [

^ NeoJSONWriter toString: (self crearDiccionario: aCollection ).
]
