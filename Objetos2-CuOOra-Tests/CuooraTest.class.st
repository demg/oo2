"
A CuooraTest is a test class for testing the behavior of Cuoora
"
Class {
	#name : #CuooraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'pastorsin',
		'topicoComic',
		'preguntaComics',
		'skydler',
		'publicacion',
		'topicoDeNingunaPregunta',
		'usuarioSinPreguntas',
		'maks',
		'preguntaComicsMaks',
		'respuestaDePastorsin',
		'respuestaDeMaks',
		'preguntaSinRespuestas',
		'topicoHistoria'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #'private-initialize' }
CuooraTest >> initializePreguntas [
	preguntaComics := cuoora
		agregarPreguntaConTitulo: '¿Alguien sabe dónde conseguir Iron Man 01?'
		descripcion: 'No lo puedo conseguir en ningún lado.'
		topicos: (OrderedCollection with: topicoComic)
		usuario: pastorsin.
	preguntaComicsMaks := cuoora
		agregarPreguntaConTitulo: 'x'
		descripcion: 'y'
		topicos: (OrderedCollection with: topicoComic)
		usuario: maks.
	preguntaSinRespuestas := cuoora
		agregarPreguntaConTitulo: 'x'
		descripcion: 'y'
		topicos: (OrderedCollection with: topicoHistoria)
		usuario: skydler.
]

{ #category : #'private-initialize' }
CuooraTest >> initializePreguntasRelevantes [
	cuoora agregarFollower: skydler a: pastorsin.
	cuoora registrarTopicoDeInteres: topicoComic a: skydler
]

{ #category : #'private-initialize' }
CuooraTest >> initializeRespuestas [
	respuestaDePastorsin := cuoora
		agregarRespuestaConTexto: 't'
		usuario: pastorsin
		enPregunta: preguntaComics.
	respuestaDeMaks := cuoora
		agregarRespuestaConTexto: 't'
		usuario: maks
		enPregunta: preguntaComicsMaks
]

{ #category : #'private-initialize' }
CuooraTest >> intializeTopicos [
	topicoComic := cuoora agregarTopicoConNombre: 'Cómics' descripcion: 'Formato de publicación de historietas'.
	topicoHistoria := cuoora agregarTopicoConNombre: 'Historia' descripcion: 'y'.
	topicoDeNingunaPregunta := cuoora agregarTopicoConNombre: 'x' descripcion: 'y'
]

{ #category : #'private-initialize' }
CuooraTest >> intializeUsuarios [
	pastorsin := cuoora crearUsuarioConNombre: 'pastorsin' contrasena: 'x'.
	skydler := cuoora crearUsuarioConNombre: 'skydler' contrasena: 'x'.
	maks := cuoora crearUsuarioConNombre: 'maks' contrasena: 'x'.
	usuarioSinPreguntas := cuoora crearUsuarioConNombre: 'n/a' contrasena: 'x'.
]

{ #category : #running }
CuooraTest >> setUp [
	cuoora := Cuoora new.
	self intializeUsuarios.
	self intializeTopicos.
	self initializePreguntas.
	self initializeRespuestas.
	self initializePreguntasRelevantes
]

{ #category : #'tests-usuarios' }
CuooraTest >> testAgregarFollowerA [
	self assert: (pastorsin followers includes: skydler).
	self deny: (skydler followers includes: pastorsin).
	"Pruebo agregar como follower 2 usuarios iguales"
	cuoora agregarFollower: pastorsin a: pastorsin.
	self deny: (pastorsin followers includes: pastorsin).
]

{ #category : #'tests-preguntas' }
CuooraTest >> testAgregarPreguntaConTituloDescripcionTopicosUsuario [
	self assert: preguntaComics isNotNil.
	self assert: (cuoora preguntas includes: preguntaComics).
	self assert: preguntaComics titulo equals: '¿Alguien sabe dónde conseguir Iron Man 01?'.
	self assert: preguntaComics descripcion equals: 'No lo puedo conseguir en ningún lado.'.
	self assert: (preguntaComics algunoDeTusTopicoEs: topicoComic).
	self assert: (preguntaComics tuCreadorEs: pastorsin)
]

{ #category : #'tests-respuestas' }
CuooraTest >> testAgregarRespuestaConTextoUsuarioEnPregunta [
	self assert: respuestaDePastorsin isNotNil.
	self assert: (preguntaComics obtenerRespuestasOrdenadas includes: respuestaDePastorsin).
	self assert: respuestaDePastorsin texto equals: 't'.
	self assert: (respuestaDePastorsin tuCreadorEs: pastorsin)
]

{ #category : #'tests-topicos' }
CuooraTest >> testAgregarTopicoConNombreDescripcion [
	self assert: topicoComic isNotNil.
	self assert: (cuoora topicos includes: topicoComic).
	self assert: topicoComic nombre equals: 'Cómics'.
	self assert: topicoComic descripcion equals: 'Formato de publicación de historietas'
]

{ #category : #'tests-preguntas' }
CuooraTest >> testBorrarPregunta [
	cuoora borrarPregunta: preguntaComics.
	self assert: (cuoora obtenerPreguntasDelUsuario: pastorsin) isEmpty.
	self deny: ((cuoora obtenerPreguntasDelTopico: topicoComic) includes: preguntaComics).
	self deny: ((cuoora preguntas) includes: preguntaComics)
]

{ #category : #'tests-constructor' }
CuooraTest >> testConstructor [
	self assert: (Cuoora new) usuarios isEmpty.
	self assert: (Cuoora new) topicos isEmpty.
	self assert: (Cuoora new) preguntas isEmpty 
]

{ #category : #'tests-usuarios' }
CuooraTest >> testCrearUsuarioConNombreContrasena [
	self assert: pastorsin isNotNil.
	self assert: (cuoora usuarios includes: pastorsin).
	self assert: pastorsin nombre equals: 'pastorsin'.
	self assert: (pastorsin tuContrasenaEs: 'x')
	
]

{ #category : #'tests-topicos' }
CuooraTest >> testExisteTopico [
	self assert: (cuoora existeTopico: 'Cómics').
	self deny: (cuoora existeTopico: 'No existe')
]

{ #category : #'tests-usuarios' }
CuooraTest >> testExisteUsuario [
	self assert: (cuoora existeUsuario: 'pastorsin').
	self deny: (cuoora existeUsuario: 'uno que no existe')
]

{ #category : #'tests-usuarios' }
CuooraTest >> testLaContrasenaDeEs [
	self assert: (cuoora laContrasenaDe: 'pastorsin' es: 'x').
	self deny: (cuoora laContrasenaDe: 'pastorsin' es: 'otra contraseña').
]

{ #category : #'tests-preguntas' }
CuooraTest >> testObtenerPreguntasDelTopico [
	self assert: (cuoora obtenerPreguntasDelTopico: topicoComic) size equals: 2.
	self assert: ((cuoora obtenerPreguntasDelTopico: topicoComic) includes: preguntaComics).
	self assert: ((cuoora obtenerPreguntasDelTopico: topicoComic) includes: preguntaComicsMaks).
	"Pruebo si no hay ninguna pregunta con ese topico"
	self assert: (cuoora obtenerPreguntasDelTopico: topicoDeNingunaPregunta) isEmpty
]

{ #category : #'tests-usuarios' }
CuooraTest >> testObtenerPreguntasDelUsuario [
	self assert: ((cuoora obtenerPreguntasDelUsuario: pastorsin) includes: preguntaComics).
	self deny: ((cuoora obtenerPreguntasDelUsuario: pastorsin) includes: preguntaComicsMaks).
	"Pruebo el caso en donde el usuario todavía no haya realizado ninguna pregunta"
	self assert: (cuoora obtenerPreguntasDelUsuario: usuarioSinPreguntas) isEmpty
]

{ #category : #'tests-usuarios' }
CuooraTest >> testObtenerPreguntasRelevantesOrdenadasPorFecha [
	self assert: (cuoora obtenerPreguntasRelevantesOrdenadasPorFecha: skydler) size equals: 2.
	self assert: (cuoora obtenerPreguntasRelevantesOrdenadasPorFecha: skydler) first equals: preguntaComicsMaks.
	self assert: (cuoora obtenerPreguntasRelevantesOrdenadasPorFecha: skydler) second equals: preguntaComics.
]

{ #category : #'tests-preguntas' }
CuooraTest >> testObtenerPreguntasRelevantesPara [
	self assert: ((cuoora obtenerPreguntasRelevantesPara: skydler) includes: preguntaComics).
	self assert: ((cuoora obtenerPreguntasRelevantesPara: skydler) includes: preguntaComicsMaks).
	"Pruebo el caso en donde no hay preguntas relevantes para el usuario"
	self assert: (cuoora obtenerPreguntasRelevantesPara: pastorsin) isEmpty
	
]

{ #category : #'tests-topicos' }
CuooraTest >> testObtenerPuntaje [
	| puntaje |
	cuoora registrarLikeEnPublicacion: preguntaComics de: pastorsin.
	cuoora registrarLikeEnPublicacion: respuestaDePastorsin de: pastorsin. 
	puntaje := cuoora obtenerPuntajedelUsuario: pastorsin.
	self assert: puntaje equals: 72.
]

{ #category : #'tests-respuestas' }
CuooraTest >> testObtenerRespuestasDeLaPregunta [
	self assert: ((cuoora obtenerRespuestasDeLaPregunta: preguntaComics) includes: respuestaDePastorsin).
	self deny: ((cuoora obtenerRespuestasDeLaPregunta: preguntaComics) includes: respuestaDeMaks).
	"Pruebo el caso en donde la pregunta no tiene respuestas"
	self assert: (cuoora obtenerRespuestasDeLaPregunta: preguntaSinRespuestas) isEmpty
]

{ #category : #'tests-usuarios' }
CuooraTest >> testObtenerRespuestasDelUsuario [
	self assert: ((cuoora obtenerRespuestasDelUsuario: pastorsin) includes: respuestaDePastorsin).
	self deny: ((cuoora obtenerRespuestasDelUsuario: pastorsin) includes: respuestaDeMaks).
	"Pruebo el caso en donde el usuario no haya realizado respuestas"
	self assert: (cuoora obtenerRespuestasDelUsuario: usuarioSinPreguntas) isEmpty
]

{ #category : #'tests-topicos' }
CuooraTest >> testObtenerTopico [
	self assert: ((cuoora obtenerTopico: 'Cómics') sosIgualA: topicoComic).
	self assert: (cuoora obtenerTopico: 'No existe') isNil.
]

{ #category : #'tests-usuarios' }
CuooraTest >> testObtenerUsuario [
	self assert: ((cuoora obtenerUsuario: 'pastorsin') sosIgualA: pastorsin).
]

{ #category : #'tests-publicaciones' }
CuooraTest >> testRegistrarDislikeEnPreguntaDe [
	cuoora registrarDislikeEnPublicacion: preguntaComics de: pastorsin.
	self assert: preguntaComics cantidadDeDislikes equals: 1.
	self assert: preguntaComics cantidadDeLikes equals: 0.
	"Pruebo que si el usuario vota dislike nuevamente no se contabilice en la publicación de nuevo"
	cuoora registrarDislikeEnPublicacion: preguntaComics de: pastorsin.
	self assert: preguntaComics cantidadDeDislikes equals: 1.
	self assert: preguntaComics cantidadDeLikes equals: 0.
	"Pruebo que si usuario vota like se borre el dislike anterior"
	cuoora registrarLikeEnPublicacion: preguntaComics de: pastorsin.
	self assert: preguntaComics cantidadDeDislikes equals: 0.
	self assert: preguntaComics cantidadDeLikes equals: 1.
	"Pruebo si un usuario registra un dislike en su propia publicacion"
	cuoora registrarDislikeEnPublicacion: preguntaComics de: skydler.
	self assert: preguntaComics cantidadDeDislikes equals: 1.
	self assert: preguntaComics cantidadDeLikes equals: 1.
]

{ #category : #'tests-publicaciones' }
CuooraTest >> testRegistrarDislikeEnRespuestaDe [
	cuoora registrarDislikeEnPublicacion: respuestaDeMaks de: pastorsin.
	self assert: respuestaDeMaks cantidadDeDislikes equals: 1.
	self assert: respuestaDeMaks cantidadDeLikes equals: 0.
	"Pruebo que si el usuario vota dislike nuevamente no se contabilice en la publicación de nuevo"
	cuoora registrarDislikeEnPublicacion: respuestaDeMaks de: pastorsin.
	self assert: respuestaDeMaks cantidadDeDislikes equals: 1.
	self assert: respuestaDeMaks cantidadDeLikes equals: 0.
	"Pruebo que si usuario vota like se borre el dislike anterior"
	cuoora registrarLikeEnPublicacion: respuestaDeMaks de: pastorsin.
	self assert: respuestaDeMaks cantidadDeDislikes equals: 0.
	self assert: respuestaDeMaks cantidadDeLikes equals: 1.
	"Pruebo si un usuario registra un dislike en su propia publicacion"
	cuoora registrarDislikeEnPublicacion: respuestaDeMaks de: skydler.
	self assert: respuestaDeMaks cantidadDeDislikes equals: 1.
	self assert: respuestaDeMaks cantidadDeLikes equals: 1.
]

{ #category : #'tests-publicaciones' }
CuooraTest >> testRegistrarLikeEnPreguntaDe [
	cuoora registrarLikeEnPublicacion: preguntaComics de: pastorsin.
	self assert: preguntaComics cantidadDeLikes equals: 1.
	self assert: preguntaComics cantidadDeDislikes equals: 0.
	"Pruebo que si el usuario vota like nuevamente no se contabilice en la publicación de nuevo"
	cuoora registrarLikeEnPublicacion: preguntaComics de: pastorsin.
	self assert: preguntaComics cantidadDeLikes equals: 1.
	self assert: preguntaComics cantidadDeDislikes equals: 0.
	"Pruebo que si usuario vota dislike se borre el like anterior"
	cuoora registrarDislikeEnPublicacion: preguntaComics de: pastorsin.
	self assert: preguntaComics cantidadDeLikes equals: 0.
	self assert: preguntaComics cantidadDeDislikes equals: 1.
	"Pruebo si un usuario registra un like en su propia publicacion"
	cuoora registrarLikeEnPublicacion: preguntaComics de: skydler.
	self assert: preguntaComics cantidadDeLikes equals: 1.
	self assert: preguntaComics cantidadDeDislikes equals: 1.
]

{ #category : #'tests-publicaciones' }
CuooraTest >> testRegistrarLikeEnRespuestaDe [
	cuoora registrarLikeEnPublicacion: respuestaDeMaks de: pastorsin.
	self assert: respuestaDeMaks cantidadDeLikes equals: 1.
	self assert: respuestaDeMaks cantidadDeDislikes equals: 0.
	"Pruebo que si el usuario vota like nuevamente no se contabilice en la publicación de nuevo"
	cuoora registrarLikeEnPublicacion: respuestaDeMaks de: pastorsin.
	self assert: respuestaDeMaks cantidadDeLikes equals: 1.
	self assert: respuestaDeMaks cantidadDeDislikes equals: 0.
	"Pruebo que si usuario vota dislike se borre el like anterior"
	cuoora registrarDislikeEnPublicacion: respuestaDeMaks de: pastorsin.
	self assert: respuestaDeMaks cantidadDeLikes equals: 0.
	self assert: respuestaDeMaks cantidadDeDislikes equals: 1.
	"Pruebo si un usuario registra un like en su propia publicacion"
	cuoora registrarLikeEnPublicacion: respuestaDeMaks de: skydler.
	self assert: respuestaDeMaks cantidadDeLikes equals: 1.
	self assert: respuestaDeMaks cantidadDeDislikes equals: 1.
]

{ #category : #'tests-topicos' }
CuooraTest >> testRegistrarTopicoDeInteresA [
	self assert: (skydler teInteresaEstaPregunta: preguntaComics)
]
