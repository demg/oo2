Class {
	#name : #'CRC16_Caculator',
	#superclass : #Caculator,
	#category : #'Objetos2Practica5-eje3'
}

{ #category : #message }
CRC16_Caculator >> crcFor: aString [

	^ CRC  crc16FromCollection: aString asString 
]
