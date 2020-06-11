Class {
	#name : #'CRC32_Calculator',
	#superclass : #Caculator,
	#category : #'Objetos2Practica5-eje3'
}

{ #category : #message }
CRC32_Calculator >> crcFor: aString [

	^ CRC  crc32FromCollection: aString asString 
]
