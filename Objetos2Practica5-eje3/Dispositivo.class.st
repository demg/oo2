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

{ #category : #'as yet unclassified' }
Dispositivo >> cambiarConexion: aConnection [
	
	connection := aConnection.
	connection  symb.
	ringer sound.
]

{ #category : #'as yet unclassified' }
Dispositivo >> coneccion [ 

	^ connection tipoDeConeccion 
]

{ #category : #sending }
Dispositivo >> crcCalculator: aData [
	| number |
	number := crcCalculator crcFor: aData.
	^ number
]

{ #category : #initialize }
Dispositivo >> initializeConector: aConector calculador: aCalculador display: aDisplay ringer: aRinger [

	
	connection := aConector.
	crcCalculator := aCalculador.
	display := aDisplay.
	ringer := aRinger .
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
