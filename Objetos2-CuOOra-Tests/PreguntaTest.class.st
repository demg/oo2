"
A PreguntaTest is a test class for testing the behavior of Pregunta
"
Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'pastorsin',
		'skydler',
		'topicoComic',
		'preguntaComics',
		'topicoCine',
		'creacionPublicacion',
		'respuesta',
		'respuestaConMenosLikes'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #'private-initialize' }
PreguntaTest >> initializeFollowers [
	pastorsin agregarFollower: skydler
]

{ #category : #'private-initialize' }
PreguntaTest >> initializeLikes [
	respuesta registrarLikeDe: pastorsin.
	preguntaComics registrarLikeDe: skydler.
]

{ #category : #'private-initialize' }
PreguntaTest >> initializePreguntas [
	preguntaComics := Pregunta
		newTitulo: '¿Alguien sabe dónde conseguir Iron Man 01?'
		descripcion: 'No lo puedo conseguir en ningún lado.'
		topicos: (OrderedCollection with: topicoComic)
		usuario: pastorsin.
	creacionPublicacion := DateAndTime now.
]

{ #category : #'private-initialize' }
PreguntaTest >> initializeRespuestas [
	respuesta := preguntaComics agregarRespuestaConTexto: 'r' usuario: pastorsin.
	respuestaConMenosLikes := preguntaComics agregarRespuestaConTexto: 'Esta debería ir segunda en la colección' usuario: pastorsin
]

{ #category : #'private-initialize' }
PreguntaTest >> initializeTopicos [
	topicoComic := Topico newNombre: 'Cómics' descripcion: 'Formato de publicación de historietas'.
	topicoCine := Topico newNombre: 'Cine' descripcion: '.'.
]

{ #category : #'private-initialize' }
PreguntaTest >> initializeUsuarios [
	pastorsin := Usuario newNombre: 'pastorsin' contrasena: 'quiero-aprobar'.
	skydler := Usuario newNombre: 'skydler' contrasena: 'yo-no-quiero-aprobar'
]

{ #category : #running }
PreguntaTest >> setUp [
	self initializeTopicos.
	self initializeUsuarios.
	self initializePreguntas.
	self initializeRespuestas.
	self initializeLikes.
	self initializeFollowers
]

{ #category : #'tests-respuestas' }
PreguntaTest >> testAgregarRespuestaConTextoUsuario [
	self assert: respuesta isNotNil.
	self assert: (preguntaComics obtenerRespuestasOrdenadas includes: respuesta).
	self assert: (respuesta tuCreadorEs: pastorsin).
	self assert: respuesta texto equals: 'r'
	
]

{ #category : #'tests-query' }
PreguntaTest >> testAlgunoDeTusTopicoEs [
	self assert: (preguntaComics algunoDeTusTopicoEs: topicoComic).
	self deny: (preguntaComics algunoDeTusTopicoEs: topicoCine)
]

{ #category : #'tests-likes' }
PreguntaTest >> testCantidadDeDislikes [
	self assert: preguntaComics cantidadDeDislikes equals: 0.
]

{ #category : #'tests-likes' }
PreguntaTest >> testCantidadDeLikes [
	self assert: preguntaComics cantidadDeLikes equals: 0.
]

{ #category : #'tests-constructor' }
PreguntaTest >> testConstructor [
	self assert: preguntaComics titulo equals: '¿Alguien sabe dónde conseguir Iron Man 01?'.
	self assert: preguntaComics descripcion equals: 'No lo puedo conseguir en ningún lado.'.
	self assert: (preguntaComics tuCreadorEs: pastorsin).
	self assert: (preguntaComics algunoDeTusTopicoEs: topicoComic).
	self assert: (preguntaComics obtenerRespuestasOrdenadas includes: respuesta).
	self assert: preguntaComics cantidadDeLikes equals: 0.
	self assert: preguntaComics cantidadDeDislikes equals: 0.
	self assert: preguntaComics fechaDeCreacion equals: creacionPublicacion asDate.
	self assert: preguntaComics horaDeCreacion hour equals: creacionPublicacion asTime hour.
	self assert: preguntaComics horaDeCreacion minutes equals: creacionPublicacion asTime minutes.
]

{ #category : #'tests-respuestas' }
PreguntaTest >> testDameLasRespuestasDel [
	"Pruebo si se busca el autor de una respuesta de la pregunta"
	self assert: (preguntaComics dameLasRespuestasDel: pastorsin) size equals: 2.
	self assert: ((preguntaComics dameLasRespuestasDel: pastorsin) includes: respuesta).
	self assert: ((preguntaComics dameLasRespuestasDel: pastorsin) includes: respuestaConMenosLikes).
	"Pruebo si se busca el autor de una respuesta que no tiene pregunta"
	self assert: (preguntaComics dameLasRespuestasDel: skydler) isEmpty
]

{ #category : #'tests-likes' }
PreguntaTest >> testDiferenciaLikes [
	self assert: preguntaComics calcularDiferenciaLikes equals: 1.
]

{ #category : #'tests-removing' }
PreguntaTest >> testEliminar [
	preguntaComics eliminar.
	self assert: preguntaComics obtenerRespuestasOrdenadas isEmpty
]

{ #category : #'tests-creacion' }
PreguntaTest >> testFechaDeCreacion [
	self assert: preguntaComics fechaDeCreacion equals: creacionPublicacion asDate.
]

{ #category : #'tests-creacion' }
PreguntaTest >> testHoraDeCreacion [
	self assert: preguntaComics horaDeCreacion hour equals: creacionPublicacion asTime hour.
	self assert: preguntaComics horaDeCreacion minutes equals: creacionPublicacion asTime minutes.
]

{ #category : #'tests-query' }
PreguntaTest >> testNombreDeTopicos [
	self assert: preguntaComics nombreDeTopicos size equals: 1.
	self assert: preguntaComics nombreDeTopicos first equals: 'Cómics'
]

{ #category : #'tests-query' }
PreguntaTest >> testObtenerRespuestasOrdenadas [
	self assert: preguntaComics obtenerRespuestasOrdenadas first equals: respuesta.
	self assert: preguntaComics obtenerRespuestasOrdenadas second equals: respuestaConMenosLikes.
]

{ #category : #'tests-likes' }
PreguntaTest >> testRegistrarDislikeDe [
	"Compruebo el switch entre el like y dislike"
	preguntaComics registrarLikeDe: skydler.
	preguntaComics registrarDislikeDe: skydler.
	self assert: preguntaComics cantidadDeDislikes equals: 1.
	self assert: preguntaComics cantidadDeLikes equals: 0.
	"Compruebo que si el mismo usuario vuelve a dar dislike no se contabilice..."
	preguntaComics registrarDislikeDe: skydler.
	self assert: preguntaComics cantidadDeDislikes equals: 1.
	"...pero si lo hace uno diferente sí"
	preguntaComics registrarDislikeDe: pastorsin.
	self assert: preguntaComics cantidadDeDislikes equals: 2.
]

{ #category : #'tests-likes' }
PreguntaTest >> testRegistrarLikeDe [
	"Compruebo el switch entre el like y dislike"
	preguntaComics registrarDislikeDe: skydler.
	preguntaComics registrarLikeDe: skydler.
	self assert: preguntaComics cantidadDeLikes equals: 1.
	self assert: preguntaComics cantidadDeDislikes equals: 0.
	"Compruebo que si el mismo usuario vuelve a dar like no se contabilice..."
	preguntaComics registrarLikeDe: skydler.
	self assert: preguntaComics cantidadDeLikes equals: 1.
	"...pero si lo hace uno diferente sí"
	preguntaComics registrarLikeDe: pastorsin.
	self assert: preguntaComics cantidadDeLikes equals: 2.
]

{ #category : #'tests-query' }
PreguntaTest >> testTuCreadorEs [
	self assert: (preguntaComics tuCreadorEs: pastorsin).
	self deny: (preguntaComics tuCreadorEs: skydler)
]

{ #category : #'tests-likes' }
PreguntaTest >> testTuCreadorEsSeguidoPor [
	self assert: (preguntaComics tuCreadorEsSeguidoPor: skydler).
	self deny: (preguntaComics tuCreadorEsSeguidoPor: pastorsin)
]
