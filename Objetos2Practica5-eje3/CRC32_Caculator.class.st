Class {
	#name : #'CRC32_Caculator',
	#superclass : #Caculator,
	#category : #'Objetos2Practica5-eje3'
}

{ #category : #message }
CRC32_Caculator >> crcFor: aString [

	^ CRC  crc32FromCollection: aString asString 
]
