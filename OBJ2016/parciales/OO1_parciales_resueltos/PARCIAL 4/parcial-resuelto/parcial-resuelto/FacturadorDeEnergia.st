Object subclass: #Cliente
	instanceVariableNames: 'nombre telefono direccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FacturadorDeEnergia'!

!Cliente methodsFor: 'setters'!
direccion: unaDireccion 
	direccion := unaDireccion! !

!Cliente methodsFor: 'setters'!
nombre: unNombre 
	nombre := unNombre! !

!Cliente methodsFor: 'setters'!
telefono: unTelefono 
	telefono := unTelefono! !


!Cliente methodsFor: 'getters'!
direccion
	^direccion! !

!Cliente methodsFor: 'getters'!
nombre
	^nombre! !

!Cliente methodsFor: 'getters'!
telefono
	^telefono! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Cliente class
	instanceVariableNames: ''!

!Cliente class methodsFor: 'creacion'!
nombre: unNombre 
	^self new nombre: unNombre! !


Object subclass: #Direccion
	instanceVariableNames: 'numeroCalle numeroCasa'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FacturadorDeEnergia'!

!Direccion methodsFor: 'setters'!
numeroCalle: unNumeroCalle 
	numeroCalle := unNumeroCalle! !

!Direccion methodsFor: 'setters'!
numeroCasa: unNumeroCasa 
	numeroCasa := unNumeroCasa! !


!Direccion methodsFor: 'getters'!
numeroCalle
	^numeroCalle! !

!Direccion methodsFor: 'getters'!
numeroCasa
	^numeroCasa! !


!Direccion methodsFor: 'inicializacion'!
calle: unNumeroCalle numero: unNumeroCasa 
	self numeroCalle: unNumeroCalle.
	self numeroCasa: unNumeroCasa! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Direccion class
	instanceVariableNames: ''!

!Direccion class methodsFor: 'creacion'!
calle: numeroCalle numero: numeroCasa 
	^self new calle: numeroCalle numero: numeroCasa! !


Object subclass: #Factura
	instanceVariableNames: 'monto medidor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FacturadorDeEnergia'!

!Factura methodsFor: 'acciones'!
direccionTitular
	^self medidor titular direccion! !

!Factura methodsFor: 'acciones'!
nombreTitular
	^self medidor titular nombre! !

!Factura methodsFor: 'acciones'!
numeroMedidor
	^self medidor numero! !


!Factura methodsFor: 'setters'!
medidor: unMedidor 
	medidor := unMedidor.
	monto := unMedidor monto.! !


!Factura methodsFor: 'getters'!
medidor
	^medidor! !

!Factura methodsFor: 'getters'!
monto
	^monto! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Factura class
	instanceVariableNames: ''!

!Factura class methodsFor: 'creacion'!
medidor: unMedidor 
	^self new medidor: unMedidor! !


Object subclass: #FacturadorDeEnergia
	instanceVariableNames: 'medidores'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FacturadorDeEnergia'!

!FacturadorDeEnergia methodsFor: 'getters'!
medidores
	"Retorna las mediciones"

	^medidores! !


!FacturadorDeEnergia methodsFor: 'inicializacion'!
initialize
	"Inicializa una instancia de la clase FacturadorDeEnergia"

	medidores := OrderedCollection new! !


!FacturadorDeEnergia methodsFor: 'medidores'!
agregarMedidor: unMedidor 
	"Agrega un medidor a la coleccion de medidores."

	self medidores add: unMedidor! !

!FacturadorDeEnergia methodsFor: 'medidores'!
medidorConNumero: unNumeroMedidor 
	"Retorna el medidor que tenga el numero recibido por parametro."

	^self medidores detect: [:medidor | medidor numero = unNumeroMedidor]! !


!FacturadorDeEnergia methodsFor: 'facturacion'!
facturarTodos: coleccionDeMedidores 
	^ coleccionDeMedidores
		collect: [:medidor | medidor facturar]! !

!FacturadorDeEnergia methodsFor: 'facturacion'!
facturarTodosLosMedidores
	^self facturarTodos: self medidores.! !

!FacturadorDeEnergia methodsFor: 'facturacion'!
facturarTodosLosMedidoresEnCalle: numeroCalle
	^self facturarTodos: (self medidoresEnCalle: numeroCalle)! !

!FacturadorDeEnergia methodsFor: 'facturacion'!
medidoresEnCalle: numeroCalle 
	^ self medidores
		select: [:medidor | medidor direccion numeroCalle == numeroCalle]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

FacturadorDeEnergia class
	instanceVariableNames: ''!

!FacturadorDeEnergia class methodsFor: 'new'!
new
	"Crea e inicializa una instancia del facturador de energia"

	^super new initialize! !


Object subclass: #MedidorReactivo
	instanceVariableNames: 'titular direccion anteUltimaMedicionReactiva ultimaMedicionReactiva numero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FacturadorDeEnergia'!

!MedidorReactivo methodsFor: 'setters'!
direccion: unaDireccion 
	direccion := unaDireccion! !

!MedidorReactivo methodsFor: 'setters'!
numero: unNumeroDeMedidor 
	numero := unNumeroDeMedidor! !

!MedidorReactivo methodsFor: 'setters'!
titular: unTitular 
	titular := unTitular! !

!MedidorReactivo methodsFor: 'setters'!
ultimaMedicionReactiva: unaMedicionReactiva 
	anteUltimaMedicionReactiva := self ultimaMedicionReactiva.
	ultimaMedicionReactiva := unaMedicionReactiva.

! !


!MedidorReactivo methodsFor: 'getters'!
anteUltimaMedicionReactiva
	^anteUltimaMedicionReactiva! !

!MedidorReactivo methodsFor: 'getters'!
direccion
	^direccion! !

!MedidorReactivo methodsFor: 'getters'!
numero
	^numero! !

!MedidorReactivo methodsFor: 'getters'!
titular
	^titular! !

!MedidorReactivo methodsFor: 'getters'!
ultimaMedicionReactiva
	^ultimaMedicionReactiva! !


!MedidorReactivo methodsFor: 'inicializacion'!
initialize
	ultimaMedicionReactiva:= 0.
	anteUltimaMedicionReactiva:= 0.! !

!MedidorReactivo methodsFor: 'inicializacion'!
titular: unTitular numero: unNumero 
	self initialize.
	self titular: unTitular.
	self numero: unNumero.
! !


!MedidorReactivo methodsFor: 'facturacion'!
facturar
	^Factura medidor: self.! !


!MedidorReactivo methodsFor: 'acciones'!
monto
	^self ultimaMedicionReactiva - self anteUltimaMedicionReactiva * self precioKwReactivo! !

!MedidorReactivo methodsFor: 'acciones'!
precioKwReactivo
	^1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

MedidorReactivo class
	instanceVariableNames: ''!

!MedidorReactivo class methodsFor: 'creacion'!
titular: unTitular numero: unNumero 
	^self new titular: unTitular numero: unNumero! !


MedidorReactivo subclass: #MedidorReactivoInductivo
	instanceVariableNames: 'anteUltimaMedicionInductiva ultimaMedicionInductiva'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FacturadorDeEnergia'!

!MedidorReactivoInductivo methodsFor: 'setters'!
ultimaMedicionInductiva: unaMedicionInductiva 
	anteUltimaMedicionInductiva := ultimaMedicionInductiva.
	ultimaMedicionInductiva := unaMedicionInductiva.! !


!MedidorReactivoInductivo methodsFor: 'getters'!
anteUltimaMedicionInductiva
	^anteUltimaMedicionInductiva! !

!MedidorReactivoInductivo methodsFor: 'getters'!
ultimaMedicionInductiva
	^ultimaMedicionInductiva! !


!MedidorReactivoInductivo methodsFor: 'acciones'!
kwInductivosExcedentes
	^0 max: (self ultimaMedicionInductiva - self anteUltimaMedicionInductiva - self limiteGratis).! !

!MedidorReactivoInductivo methodsFor: 'acciones'!
limiteGratis
	^1000! !

!MedidorReactivoInductivo methodsFor: 'acciones'!
monto
	^super monto + self montoInductivo! !

!MedidorReactivoInductivo methodsFor: 'acciones'!
montoInductivo
	^self kwInductivosExcedentes * self precioKwInductivo
	! !

!MedidorReactivoInductivo methodsFor: 'acciones'!
precioKwInductivo
	^2! !


!MedidorReactivoInductivo methodsFor: 'inicializacion'!
initialize
	super initialize.
	anteUltimaMedicionInductiva := 0.
	ultimaMedicionInductiva := 0! !
