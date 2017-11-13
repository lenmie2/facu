<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.3.1 of April 20, 2005 on March 3, 2011 at 9:12:37 am</time-stamp>
<!-- Package OO1-2010-3eraFEcha* -->


<class>
<name>Tarjeta</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>juegosVisitados puntosAcumulados credito </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Parcial 3</category>
<attributes>
<package>OO1-2010-3eraFEcha</package>
</attributes>
</class>

<class>
<name>Juego</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>precio nombre </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Parcial 3</category>
<attributes>
<package>OO1-2010-3eraFEcha</package>
</attributes>
</class>

<class>
<name>JuegoComun</name>
<environment>Smalltalk</environment>
<super>Juego</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Parcial 3</category>
<attributes>
<package>OO1-2010-3eraFEcha</package>
</attributes>
</class>

<class>
<name>JuegoEspecial</name>
<environment>Smalltalk</environment>
<super>Juego</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Parcial 3</category>
<attributes>
<package>OO1-2010-3eraFEcha</package>
</attributes>
</class>





<methods>
<class-id>Juego class</class-id> <category>instance creation</category>

<body package="OO1-2010-3eraFEcha" selector="new:precio:">new: unNombre precio: unPrecio
	"Answer a newly created and initialized instance."

	^self new initialize: unNombre precio:unPrecio.</body>
</methods>


<methods>
<class-id>Juego</class-id> <category>accessing</category>

<body package="OO1-2010-3eraFEcha" selector="precio">precio
	^precio</body>

<body package="OO1-2010-3eraFEcha" selector="nombre">nombre
^ nombre</body>

<body package="OO1-2010-3eraFEcha" selector="puntos">puntos
	self subclassResponsibility</body>

<body package="OO1-2010-3eraFEcha" selector="precio:">precio: anObject
	precio := anObject</body>

<body package="OO1-2010-3eraFEcha" selector="nombre:">nombre: unNombre
nombre:= unNombre</body>
</methods>

<methods>
<class-id>Juego</class-id> <category>initialize-release</category>

<body package="OO1-2010-3eraFEcha" selector="initialize:precio:">initialize: unNombre precio:unPrecio
	self precio: unPrecio.
      self nombre: unNombre.
	
	^self</body>
</methods>


<methods>
<class-id>JuegoEspecial</class-id> <category>accessing</category>

<body package="OO1-2010-3eraFEcha" selector="puntos">puntos

^ 3 * self precio.</body>
</methods>


<methods>
<class-id>Tarjeta class</class-id> <category>testing</category>

<body package="OO1-2010-3eraFEcha" selector="test">test
	| tarjeta autos calesita |
	tarjeta := Tarjeta cargaInicial: 50.
	autos := JuegoEspecial new: 'Autos Chocadores' precio: 3.
	calesita := JuegoComun new: 'Calesita' precio: 2.
	tarjeta cobrarVueltaPara: autos.
	tarjeta cobrarVueltaPara: autos.
	tarjeta cobrarVueltaPara: calesita.
	tarjeta puntosAcumulados.
	tarjeta juegoMasVisitado.
	tarjeta imprimirNombresDeJuegosVisitados</body>
</methods>

<methods>
<class-id>Tarjeta class</class-id> <category>instance creation</category>

<body package="OO1-2010-3eraFEcha" selector="cargaInicial:">cargaInicial: aNumber


	^self new initialize credito: aNumber</body>
</methods>


<methods>
<class-id>Tarjeta</class-id> <category>printing</category>

<body package="OO1-2010-3eraFEcha" selector="juegoMasVisitado">juegoMasVisitado
	"Imprime en el Transcript el nombre del juego donde se dieron mas vueltas con la tarjeta receptora."

	| juego |
	juego := (self nombresJuegos asSortedCollection: 
					[:a :b | 
					(self nombresJuegos occurrencesOf: a) 
						&gt; (self nombresJuegos occurrencesOf: b)]) 
				first.
	Transcript show: juego.</body>

<body package="OO1-2010-3eraFEcha" selector="imprimirNombresDeJuegosVisitados">imprimirNombresDeJuegosVisitados
	"Imprime sin repeticiones, los nombres de los juegos visitados utilizando esta tarjeta"

	self nombresJuegos asSet do: [:n | Transcript show: n].</body>
</methods>

<methods>
<class-id>Tarjeta</class-id> <category>initialize-release</category>

<body package="OO1-2010-3eraFEcha" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."


	self juegosVisitados: OrderedCollection new.
	self puntosAcumulados: 0.
	self credito: 0.
	
	^self</body>
</methods>

<methods>
<class-id>Tarjeta</class-id> <category>accessing</category>

<body package="OO1-2010-3eraFEcha" selector="juegosVisitados">juegosVisitados
	^juegosVisitados</body>

<body package="OO1-2010-3eraFEcha" selector="credito:">credito: anObject
	credito := anObject</body>

<body package="OO1-2010-3eraFEcha" selector="puntosAcumulados">puntosAcumulados
	^puntosAcumulados</body>

<body package="OO1-2010-3eraFEcha" selector="juegosVisitados:">juegosVisitados: anObject
	juegosVisitados := anObject</body>

<body package="OO1-2010-3eraFEcha" selector="cargarPesos:">cargarPesos: unNumero 
	"Carga los creditos correspondientes a la cantidad de pesos recibida por parametro"

	self credito: unNumero</body>

<body package="OO1-2010-3eraFEcha" selector="puntosAcumulados:">puntosAcumulados: anObject
	puntosAcumulados := anObject</body>

<body package="OO1-2010-3eraFEcha" selector="credito">credito
	^credito</body>

<body package="OO1-2010-3eraFEcha" selector="cobrarVueltaPara:">cobrarVueltaPara: unJuego 
	"Resta de los creditos de la tarjeta lo que corresponda de acuerdo al juego, sumando los puntos poromocionales que correspondan"

	self credito &gt; unJuego precio 
		ifTrue: 
			[self credito: self credito - unJuego precio.
			self puntosAcumulados: self puntosAcumulados + unJuego puntos.
			self juegosVisitados add: unJuego]</body>
</methods>

<methods>
<class-id>Tarjeta</class-id> <category>private</category>

<body package="OO1-2010-3eraFEcha" selector="nombresJuegos">nombresJuegos
	"Retorna la coleccion con los nombres de los juegos que visito"

	^self juegosVisitados collect: [:juego | juego nombre]</body>
</methods>


<methods>
<class-id>JuegoComun</class-id> <category>accessing</category>

<body package="OO1-2010-3eraFEcha" selector="puntos">puntos

^ 1</body>
</methods>



</st-source>
