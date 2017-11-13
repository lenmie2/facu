OrderedCollection>>	add: newObject
	^self addLast: newObject

SortedCollection>> add: newObject
	^super insert: newObject before: (self indexForInserting: newObject)


	"OrderedCollection>> insert: anObject before: aSpot
		inserte un objeto despues de haber localizado aSpot del receptor.
		privado de OrderedCollection"

Array>> add: NO LO ENTIENDE

Dictionary>> add: anAssociation
	anAssociation debe ser de la forma key->value

Bag>> add:
	incluye newObject en la colleccion

Set>> add: newObject
	busca si hay una ocurrecia de newObject en el receptor y si no es asi incluye newObject en la colleccion



1-	Si. No se le puede enviar #add: a un Array. A un Set si, pero no entiende #at y #at:put: ya que carece
de orden.

2-	Retorna un Array con los elementos que cumplen con aBlock. Retorna un nuevo Dictionary con los Associations cuyos values cumplan con aBlock. Retorna un SortedCollecion con los elementos que cumplen 
con aBlock

3- Retorna el tamaño del Array (10). Retorna 0 (reconoce un array de 10 elementos pero tienen todos nil)

4- No es posible eliminar elementos del Array

5- SequenceableCollection>> indexOf: . SequenceableCollection>> detectIndex: . No porque Set no tiene indice

6- #detect:ifNone: va a evaluar exceptionBlock si no encuentra el elemento en la collecion

7-	aSortedCollection sort: [ :e1 :e2 | e1 size > e2 size].
	^SortedCollection withAll: #('javier' 'carolina' 'sabrina')-

8- anArray asSet

9- (por algun motivo) me quedo con el ultimo elemento. (por algun motivo) no funciona

10- Elimina la collecion entera. No tengo idea.

11- contains recibe un bloque a evaluar como parametro. includes un objeto elemento.






