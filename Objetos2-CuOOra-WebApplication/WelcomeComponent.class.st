"
| app |
app := WAAdmin register: WelcomeComponent asApplicationAt: 'cuoora'.
app preferenceAt: #sessionClass put: InnSession
"
Class {
	#name : #WelcomeComponent,
	#superclass : #BaseComponent,
	#category : #'Objetos2-CuOOra-WebApplication'
}

{ #category : #private }
WelcomeComponent >> crearUsuario [
	cuoora
		crearUsuarioConNombre: self session user
		contrasena: self session password
]

{ #category : #private }
WelcomeComponent >> existeUsuario [
	^ cuoora existeUsuario: self session user
]

{ #category : #initialization }
WelcomeComponent >> initialize [
	super initialize.
	cuoora := Cuoora example.
]

{ #category : #private }
WelcomeComponent >> laContrasenaEsCorrecta [
	^ cuoora laContrasenaDe: self session user es: self session password
]

{ #category : #callbacks }
WelcomeComponent >> login [
	self loginForm.
	self existeUsuario
		ifFalse: [ self crearUsuario ]
		ifTrue: [ self laContrasenaEsCorrecta
				ifFalse: [ ^ self logout ] ].
	self show: (HomeBrowserComponent newCuoora: cuoora)
]

{ #category : #private }
WelcomeComponent >> loginForm [
	self session
		loginUser: (self request: 'Ingresa tu nombre de usuario:')
		password: (self request: 'Ingresa tu contraseña').

]

{ #category : #rendering }
WelcomeComponent >> renderContentOn: html [
	super renderContentOn: html.
	html heading level2 with: [ html emphasis: 'Bienvenido!' ].
	html big: [ html emphasis: 'Inicia sesión para comenzar' ]
]

{ #category : #'rendering-header' }
WelcomeComponent >> renderUsuarioConectadoHeader: html [
	html anchor
		callback: [ self login ];
		with: 'Login'
]
