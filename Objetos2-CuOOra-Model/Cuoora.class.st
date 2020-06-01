"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	preguntas:		<Object>
	topicos:		<Object>
	usuarios:		<Object>


    Implementation Points
"
Class {
	#name : #Cuoora,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'preguntas',
		'topicos'
	],
	#classInstVars : [
		'cuoora',
		'pedro',
		'diego',
		'juan',
		'topicoOO1',
		'topicoTestDeUnidad',
		'topicoSmalltalk',
		'preguntaDePedro',
		'preguntaDeDiego',
		'respuestaDeDiego',
		'respuestaDePedro'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #example }
Cuoora class >> example [
	cuoora := Cuoora new.
	self exampleUsuarios.
	self exampleTopicos.
	self examplePreguntas.
	self exampleRespuestas.
	juan agregarTopicoDeInteres: topicoOO1.
	^ cuoora
]

{ #category : #'private-examples' }
Cuoora class >> examplePreguntas [
	preguntaDePedro := cuoora
		agregarPreguntaConTitulo: '¿Para qué sirve el método SetUp?'
		descripcion: 'Hola, estaba leyendo la documentación de Test Unit y no puedo entender para que srive el método SetUp.'
		topicos: (OrderedCollection with: topicoOO1 with: topicoTestDeUnidad)
		usuario: pedro.
	preguntaDeDiego := cuoora
		agregarPreguntaConTitulo: '¿Qué significa #messageNotUnderstood?'
		descripcion: 'Hola, me salta ese error y no lo puedo solucionar. Ayuda!'
		topicos: (OrderedCollection with: topicoOO1 with: topicoSmalltalk)
		usuario: diego.
]

{ #category : #'private-examples' }
Cuoora class >> exampleRespuestas [
	respuestaDeDiego := cuoora
		agregarRespuestaConTexto: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de cada test.'
		usuario: diego
		enPregunta: preguntaDePedro.
	respuestaDePedro := cuoora
		agregarRespuestaConTexto: 'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta'
		usuario: pedro
		enPregunta: preguntaDeDiego
]

{ #category : #'private-examples' }
Cuoora class >> exampleTopicos [
	topicoOO1 := cuoora agregarTopicoConNombre: 'OO1' descripcion: ''.
	topicoTestDeUnidad := cuoora agregarTopicoConNombre: 'Test de unidad' descripcion: ''.
	topicoSmalltalk := cuoora agregarTopicoConNombre: 'Smalltalk' descripcion: ''
]

{ #category : #'private-examples' }
Cuoora class >> exampleUsuarios [
	pedro := cuoora crearUsuarioConNombre: 'pedro@cuoora.com' contrasena: 'pedro@cuoora.com'.
	diego := cuoora crearUsuarioConNombre: 'diego@cuoora.com' contrasena: 'diego@cuoora.com'.
	juan := cuoora crearUsuarioConNombre: 'juan@cuoora.com' contrasena: 'juan@cuoora.com'.
	cuoora agregarFollower: juan a: diego.
	cuoora agregarFollower: pedro a: juan.
	
]

{ #category : #usuarios }
Cuoora >> agregarFollower: follower a: usuarioDestino [
	(follower sosIgualA: usuarioDestino)
		ifFalse: [ usuarioDestino agregarFollower: follower ]
]

{ #category : #preguntas }
Cuoora >> agregarPreguntaConTitulo: titulo descripcion: descripcion topicos: unosTopicos usuario: usuario [
	| nuevaPregunta |
	nuevaPregunta := Pregunta newTitulo: titulo descripcion: descripcion topicos: unosTopicos usuario: usuario.
	preguntas add: nuevaPregunta.
	^ nuevaPregunta
]

{ #category : #respuestas }
Cuoora >> agregarRespuestaConTexto: texto usuario: usuario enPregunta: pregunta [
	^ pregunta agregarRespuestaConTexto: texto usuario: usuario
]

{ #category : #topicos }
Cuoora >> agregarTopicoConNombre: nombre descripcion: descripcion [
	| nuevoTopico |
	nuevoTopico := Topico newNombre: nombre descripcion: descripcion.
	topicos add: nuevoTopico.
	^ nuevoTopico
]

{ #category : #preguntas }
Cuoora >> borrarPregunta: pregunta [
	pregunta eliminar.
	preguntas remove: pregunta
]

{ #category : #usuarios }
Cuoora >> crearUsuarioConNombre: nombre contrasena: contrasena [
	| nuevoUsuario |
	nuevoUsuario := Usuario newNombre: nombre contrasena: contrasena.
	usuarios add: nuevoUsuario.
	^ nuevoUsuario 
]

{ #category : #topicos }
Cuoora >> existeTopico: nombreTopico [
	^ topicos anySatisfy: [ :topico | topico tuNombreEs: nombreTopico ]
]

{ #category : #usuarios }
Cuoora >> existeUsuario: nombreDeUsuario [
	^ usuarios anySatisfy: [ :usuario | usuario tuNombreEs: nombreDeUsuario ]
]

{ #category : #initialization }
Cuoora >> initialize [
	preguntas := OrderedCollection new.
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new
]

{ #category : #usuarios }
Cuoora >> laContrasenaDe: nombreUsuario es: contrasena [
	^ (self obtenerUsuario: nombreUsuario) tuContrasenaEs: contrasena
]

{ #category : #usuarios }
Cuoora >> obtenerDiferenciaLikesDelUsuario: unUser [
	| diferenciaRespuestas respuestasUser diferenciaPreguntas preguntasUser |
	respuestasUser := self obtenerRespuestasDelUsuario: unUser.
	diferenciaRespuestas := respuestasUser sumNumbers: [: respuesta | respuesta calcularDiferenciaLikes]. 
	preguntasUser := self obtenerPreguntasDelUsuario: unUser.
	diferenciaPreguntas := preguntasUser sumNumbers: [: pregunta | pregunta calcularDiferenciaLikes ].
	^diferenciaRespuestas + diferenciaPreguntas  
]

{ #category : #preguntas }
Cuoora >> obtenerPreguntasDelTopico: topico [
	^ preguntas select: [ :pregunta | pregunta algunoDeTusTopicoEs: topico ]
]

{ #category : #usuarios }
Cuoora >> obtenerPreguntasDelUsuario: usuario [
	^ preguntas select: [ :pregunta | pregunta tuCreadorEs: usuario ]
]

{ #category : #preguntas }
Cuoora >> obtenerPreguntasRelevantesOrdenadasPorFecha: usuario [
	^ (self obtenerPreguntasRelevantesPara: usuario) sort: [ :pregunta1 :pregunta2 | pregunta1 fechaDeCreacion > pregunta2 fechaDeCreacion ]
]

{ #category : #preguntas }
Cuoora >> obtenerPreguntasRelevantesPara: usuario [
	^ preguntas select: [ :pregunta | (usuario teInteresaEstaPregunta: pregunta) or: (pregunta tuCreadorEsSeguidoPor: usuario) ]
]

{ #category : #usuarios }
Cuoora >> obtenerPuntajePreguntasDelUsuario: unUser [
	| puntajePreguntas preguntasUser |
	preguntasUser := self obtenerPreguntasDelUsuario:unUser.
	puntajePreguntas := preguntasUser size * 20. 
	^puntajePreguntas 
]

{ #category : #usuarios }
Cuoora >> obtenerPuntajeRespuestasDelUsuario: unUser [
	| puntajeRespuestas respuestasUser |
	respuestasUser := self obtenerRespuestasDelUsuario: unUser.
	puntajeRespuestas := respuestasUser size * 50. 
	^puntajeRespuestas 
]

{ #category : #usuarios }
Cuoora >> obtenerPuntajedelUsuario: unUser [
	^(self obtenerPuntajePreguntasDelUsuario: unUser) + (self obtenerPuntajeRespuestasDelUsuario: unUser) + (self obtenerDiferenciaLikesDelUsuario: unUser) 
]

{ #category : #respuestas }
Cuoora >> obtenerRespuestasDeLaPregunta: pregunta [
	^ pregunta obtenerRespuestasOrdenadas
]

{ #category : #usuarios }
Cuoora >> obtenerRespuestasDelUsuario: usuario [
	^ preguntas flatCollect: [ :pregunta | pregunta dameLasRespuestasDel: usuario ]
]

{ #category : #topicos }
Cuoora >> obtenerTopico: nombreDeTopico [
	^ topicos detect: [ :topico | topico tuNombreEs: nombreDeTopico ] ifNone: [ nil ]
]

{ #category : #usuarios }
Cuoora >> obtenerUsuario: nombreDeUsuario [
	^ usuarios detect: [ :usuario | usuario tuNombreEs: nombreDeUsuario ]
]

{ #category : #accessing }
Cuoora >> preguntas [
	^ preguntas 
]

{ #category : #publicaciones }
Cuoora >> registrarDislikeEnPublicacion: publicacion de: usuario [
	publicacion registrarDislikeDe: usuario
]

{ #category : #publicaciones }
Cuoora >> registrarLikeEnPublicacion: publicacion de: usuario [
	publicacion registrarLikeDe: usuario
]

{ #category : #topicos }
Cuoora >> registrarTopicoDeInteres: topico a: usuario [
	usuario agregarTopicoDeInteres: topico
]

{ #category : #accessing }
Cuoora >> topicos [
	^ topicos 
]

{ #category : #accessing }
Cuoora >> usuarios [
	^ usuarios 
]
