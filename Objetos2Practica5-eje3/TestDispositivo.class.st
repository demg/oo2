Class {
	#name : #TestDispositivo,
	#superclass : #TestCase,
	#instVars : [
		'connection4G',
		'connectionWiFi',
		'display',
		'ringer',
		'calculador16',
		'calculador32',
		'dispositivo16',
		'dispositivo32'
	],
	#category : #'Objetos2Practica5-eje3'
}

{ #category : #initialization }
TestDispositivo >> initializeCalculadores [

	calculador16 := CRC16_Calculator  new.
	calculador32 := CRC32_Calculator  new.
]

{ #category : #initialization }
TestDispositivo >> initializeConnections [
	connectionWiFi := WiFiConn new.
	connection4G := Adapter4G new: Conn4G new
]

{ #category : #initialization }
TestDispositivo >> initializeDisplay [
	display := Displays new
]

{ #category : #initialization }
TestDispositivo >> initializeDispositivo [

	dispositivo16 := Dispositivo  new initializeConector: connectionWiFi  calculador: calculador16 display: display ringer: ringer.
	dispositivo32 := Dispositivo  new initializeConector: connectionWiFi  calculador: calculador32 display: display ringer: ringer.

	
]

{ #category : #initialization }
TestDispositivo >> initializeRinger [
	ringer := Ringer new
]

{ #category : #running }
TestDispositivo >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	self initializeCalculadores.
	self initializeConnections.
	self initializeDisplay.
	self initializeRinger.
	self initializeDispositivo .
]

{ #category : #'as yet unclassified' }
TestDispositivo >> testcambiarConeccion [
	
	dispositivo16 cambiarConexion: connectionWiFi.
	self assert: (dispositivo16 coneccion ) equals:'Connection WiFi' . 
	dispositivo16 cambiarConexion: connection4G.
	self assert: (dispositivo16 coneccion ) equals:'Connection 4G' .
]

{ #category : #'as yet unclassified' }
TestDispositivo >> testcrcFor [

	self assert: (dispositivo16 send: 'datosDeTesteo'). 
]
