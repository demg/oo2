Class {
	#name : #Dispositivo,
	#superclass : #Object,
	#instVars : [
		'ringer',
		'display',
		'crcCalculator',
		'connection'
	],
	#category : #'Objetos2Practica5-eje3'
}

{ #category : #sending }
Dispositivo >> crcCalculator: aData [
	| number |
	number := crcCalculator crcFor: aData.
	^ number
]

{ #category : #initialize }
Dispositivo >> initialize [ 

	super initialize.
	connection := Conn4G  new.
	crcCalculator := CRC16_Caculator new.
	display := Displays new.
	ringer := Ringer new.
]

{ #category : #sending }
Dispositivo >> send: aData [
	| numero |
	numero := self crcCalculator: aData.
	self sendData: aData crc: numero
]

{ #category : #sending }
Dispositivo >> sendData: aData crc: number [
	connection sendData: aData crc: number
]

{ #category : #'effects-toggle' }
Dispositivo >> toggle [

	connection := connection toggle 
]
