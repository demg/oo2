"
An UsuarioTest is a test class for testing the behavior of Usuario
"
Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'pastorsin',
		'pastorsin2',
		'skydler',
		'preguntaWindowsLinux',
		'informatica',
		'sistemasOperativos',
		'cocina',
		'preguntaCocina',
		'creacionSkydler'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #'private-initialize' }
UsuarioTest >> initializePreguntas [
	preguntaWindowsLinux := Pregunta
		newTitulo: '¿Windows es mejor que Ubuntu?'
		descripcion: 'Todos me dicen que si, pero no sé porqué'
		topicos: (OrderedCollection with: informatica with: sistemasOperativos)
		usuario: pastorsin.
	preguntaCocina := Pregunta
		newTitulo: '¿Cómo hacer fideos?'
		descripcion: 'Tengo hambre y estoy solo en casa, no se que hacer, ayudaa!!'
		topicos: (OrderedCollection with: cocina)
		usuario: skydler
]

{ #category : #'private-initialize' }
UsuarioTest >> initializeTopicos [
	informatica := Topico newNombre: 'Informática' descripcion: 'lo más lindo  que hay'.
	sistemasOperativos := Topico newNombre: 'Sistemas operativos' descripcion: 'windows vs linux'.
	cocina := Topico newNombre: 'Cocina' descripcion: 'hay que cocinar'
]

{ #category : #'private-initialize' }
UsuarioTest >> initializeUsuarios [
	pastorsin := Usuario newNombre: 'pastorsin' contrasena: 'quiero-aprobar'.
	pastorsin2 := Usuario newNombre: 'pastorsin' contrasena: 'yo-tambien-quiero-aprobar-:v'.
	skydler := Usuario newNombre: 'skydler' contrasena: 'yo-no-quiero-aprobar'.
	creacionSkydler := DateAndTime now
]

{ #category : #running }
UsuarioTest >> setUp [
	self initializeTopicos.
	self initializeUsuarios.	
	self initializePreguntas.
	skydler agregarFollower: pastorsin
]

{ #category : #'tests-followers' }
UsuarioTest >> testAgregarFollower [
	self assert: (skydler followers includes: pastorsin).
	self assert: skydler followers size equals: 1
]

{ #category : #'tests-topicos' }
UsuarioTest >> testAgregarTopicoDeInteres [
	pastorsin agregarTopicoDeInteres: informatica.
	"Si le gusta una pregunta con un tópico de interés en común, entonces prueba que se agregó exitosamente el tópico de interés"
	self assert: (pastorsin teInteresaEstaPregunta: preguntaWindowsLinux).
	self assert: (pastorsin topicosDeInteres size) equals: 1.
]

{ #category : #'tests-constructor' }
UsuarioTest >> testConstructor [
	self assert: skydler nombre equals: 'skydler'.
	self assert: (skydler tuContrasenaEs: 'yo-no-quiero-aprobar').
	self assert: skydler fechaDeCreacion equals: creacionSkydler asDate.
	self assert: skydler horaDeCreacion hour equals: creacionSkydler hour.
	self assert: skydler horaDeCreacion minutes equals: creacionSkydler minutes.
	self assert: (skydler followers includes: pastorsin).
	self assert: skydler topicosDeInteres isEmpty.
]

{ #category : #'tests-creacion' }
UsuarioTest >> testFechaDeCreacion [
	self assert: skydler fechaDeCreacion equals: creacionSkydler asDate.
]

{ #category : #'tests-creacion' }
UsuarioTest >> testHoraDeCreacion [
	self assert: skydler horaDeCreacion hour equals: creacionSkydler hour.
	self assert: skydler horaDeCreacion minutes equals: creacionSkydler minutes.
]

{ #category : #'tests-comparing' }
UsuarioTest >> testSosIgualA [
	self assert: (pastorsin sosIgualA: pastorsin2).
	self deny: (pastorsin sosIgualA: skydler).
]

{ #category : #'tests-comparing' }
UsuarioTest >> testTeInteresaEstaPregunta [
	pastorsin agregarTopicoDeInteres: informatica.	
	self assert: (pastorsin teInteresaEstaPregunta: preguntaWindowsLinux).
	self deny: (pastorsin teInteresaEstaPregunta: preguntaCocina).
 	"Usuario sin topicos de interés"
	self deny: (skydler teInteresaEstaPregunta: preguntaWindowsLinux)
]

{ #category : #'tests-comparing' }
UsuarioTest >> testTeSigue [
	self assert: (skydler teSigue: pastorsin).
	self deny: (pastorsin teSigue: skydler)
]

{ #category : #'tests-comparing' }
UsuarioTest >> testTuContrasenaEs [
	self assert: (pastorsin tuContrasenaEs: 'quiero-aprobar').
	self deny: (pastorsin tuContrasenaEs: 'hola!')
]

{ #category : #'tests-comparing' }
UsuarioTest >> testTuNombreEs [
	self assert: (pastorsin tuNombreEs: 'pastorsin').
	self deny: (pastorsin tuNombreEs: 'otro nombre')
]
