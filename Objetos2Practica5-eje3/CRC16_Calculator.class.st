Class {
	#name : #'CRC16_Calculator',
	#superclass : #Caculator,
	#category : #'Objetos2Practica5-eje3'
}

{ #category : #message }
CRC16_Calculator >> crcFor: aString [

	^ CRC  crc16FromCollection: aString asString 
]
