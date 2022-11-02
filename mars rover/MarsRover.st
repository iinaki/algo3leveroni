!classDefinition: #TestMarsRover category: 'MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:25:39'!
assertaQueConElRover: unMarsRover alMandarleLosComandos: unaSerieDeComandos quedaEnLasCoordenadas: unasCoordenadas yApuntandoA: unPuntoCardinal
	
	unMarsRover recibirComandos: unaSerieDeComandos.
	
	self assert: (unMarsRover estaUbicadoEn: unasCoordenadas).
	self assert: (unMarsRover estaApuntandoA: unPuntoCardinal).! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:24:00'!
test01SiLeMandamosUnComandoVacioNoHaceNada

	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #N) alMandarleLosComandos: #() quedaEnLasCoordenadas: 1@1 yApuntandoA: #N! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:25:49'!
test02ApuntaAlNorteYConLeftApuntaAlOeste
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #N) alMandarleLosComandos: #(L) quedaEnLasCoordenadas: 1@1 yApuntandoA: #O! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:26:16'!
test03ApuntaAlOesteYConLeftApuntaAlSur
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #O) alMandarleLosComandos: #(L) quedaEnLasCoordenadas: 1@1 yApuntandoA: #S! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:26:43'!
test04ApuntaAlSurYConLeftApuntaAlEste

	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #S) alMandarleLosComandos: #(L) quedaEnLasCoordenadas: 1@1 yApuntandoA: #E! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:26:59'!
test05ApuntaAlEsteYConLeftApuntaAlNorte
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #E) alMandarleLosComandos: #(L) quedaEnLasCoordenadas: 1@1 yApuntandoA: #N! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:27:38'!
test06ApuntaAlNorteYConRightApuntaAlEste
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #N) alMandarleLosComandos: #(R) quedaEnLasCoordenadas: 1@1 yApuntandoA: #E
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:28:00'!
test07ApuntaAlEsteYConRightApuntaAlSur
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #E) alMandarleLosComandos: #(R) quedaEnLasCoordenadas: 1@1 yApuntandoA: #S
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:28:20'!
test08ApuntaAlSurYConRightApuntaAlOeste
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #S) alMandarleLosComandos: #(R) quedaEnLasCoordenadas: 1@1 yApuntandoA: #O
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:28:59'!
test09ApuntaAlOesteYConRightApuntaAlNorte
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #O) alMandarleLosComandos: #(R) quedaEnLasCoordenadas: 1@1 yApuntandoA: #N
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:29:33'!
test10ApuntaAlNorteYConForwardAvanzaEnElEjeY
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #N) alMandarleLosComandos: #(F) quedaEnLasCoordenadas: 1@2 yApuntandoA: #N
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:29:57'!
test11ApuntaAlNorteYConBackRetrocedeEnElEjeY

	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #N) alMandarleLosComandos: #(B) quedaEnLasCoordenadas: 1@0 yApuntandoA: #N
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:30:25'!
test12ApuntaAlEsteYConForwardAvanzaEnElEjeX
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #E) alMandarleLosComandos: #(F) quedaEnLasCoordenadas: 2@1 yApuntandoA: #E
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:30:53'!
test13ApuntaAlEsteYConBackRetrocedeEnElEjeX
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #E) alMandarleLosComandos: #(B) quedaEnLasCoordenadas: 0@1 yApuntandoA: #E
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:31:15'!
test14ApuntaAlOesteYConForwardRetrocedeEnElEjeX
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #O) alMandarleLosComandos: #(F) quedaEnLasCoordenadas: 0@1 yApuntandoA: #O
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:31:41'!
test15ApuntaAlOesteYConBackAvanzaEnElEjeX
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #O) alMandarleLosComandos: #(B) quedaEnLasCoordenadas: 2@1 yApuntandoA: #O
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:32:06'!
test16ApuntaAlSurYConForwardRetrocedeEnElEjeY
	
	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #S) alMandarleLosComandos: #(F) quedaEnLasCoordenadas: 1@0 yApuntandoA: #S
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:32:37'!
test17ApuntaAlSurYConBackAvanzaEnElEjeY

	self assertaQueConElRover: (MarsRover ubicadoEn: 1@1 apuntandoA: #S) alMandarleLosComandos: #(B) quedaEnLasCoordenadas: 1@2 yApuntandoA: #S
! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:56:26'!
test18RecibirUnSoloComandoInvalidoTiraError

	| marsRover |
	
	marsRover := MarsRover ubicadoEn: 1@1 apuntandoA: #E.
	
	self
        should: [ marsRover recibirComandos: #(Q) ]
        raise: Error - MessageNotUnderstood 
        withExceptionDo: [ :anError |
            self assert: 'Se recibio un comando invalido' equals: anError messageText ].

	self assert: (marsRover estaUbicadoEn: 1@1).
	self assert: (marsRover estaApuntandoA: #E).! !

!TestMarsRover methodsFor: 'testing' stamp: 'i 10/30/2022 19:56:18'!
test19RecibirUnComandoInvalidoCortaLaEjecucionDeComandosYTiraError

	| marsRover |
	
	marsRover := MarsRover ubicadoEn: 1@1 apuntandoA: #E.
	
	self
        should: [ marsRover recibirComandos: #(F F Q L F) ]
        raise: Error - MessageNotUnderstood 
        withExceptionDo: [ :anError |
            self assert: 'Se recibio un comando invalido' equals: anError messageText ].

	self assert: (marsRover estaUbicadoEn: 3@1).
	self assert: (marsRover estaApuntandoA: #E).! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'coordenada orientacionActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 't 11/2/2022 17:12:31'!
initializeUbicadoEn: unaCoordenada apuntandoA: unPuntoCardinal 

	coordenada := unaCoordenada.
	orientacionActual := OrientacionDelMarsRover conOrientacion: unPuntoCardinal.! !


!MarsRover methodsFor: 'movimiento del rover' stamp: 't 11/2/2022 17:23:00'!
estaApuntandoA: unPuntoCardinal 
	^orientacionActual class coincideCon: unPuntoCardinal.! !

!MarsRover methodsFor: 'movimiento del rover' stamp: 'i 10/30/2022 18:46:33'!
estaUbicadoEn: unaCoordenada 
	^coordenada = unaCoordenada.! !

!MarsRover methodsFor: 'movimiento del rover' stamp: 'i 10/30/2022 19:51:54'!
recibirComandos: anArray 
	anArray isEmpty ifTrue: [^self].
	
	anArray do: [:unComando |
		(self comandoInvalido: unComando) ifTrue: [^self error: 'Se recibio un comando invalido'].
		self recibirComando: unComando.
	].
	
	! !


!MarsRover methodsFor: 'private' stamp: 't 11/2/2022 18:01:53'!
avanzar
	
	orientacionActual darDireccionesParaQueAvance: self.
! !

!MarsRover methodsFor: 'private' stamp: 't 11/2/2022 17:20:03'!
avanzarHaciaElEste
	coordenada := coordenada + (1@0)! !

!MarsRover methodsFor: 'private' stamp: 't 11/2/2022 17:20:17'!
avanzarHaciaElNorte
	coordenada := coordenada + (0@1)! !

!MarsRover methodsFor: 'private' stamp: 't 11/2/2022 17:20:35'!
avanzarHaciaElOeste
	coordenada := coordenada - (1@0)! !

!MarsRover methodsFor: 'private' stamp: 't 11/2/2022 17:20:50'!
avanzarHaciaElSur
	coordenada := coordenada - (0@1)! !

!MarsRover methodsFor: 'private' stamp: 't 11/2/2022 17:27:08'!
cambiarOrientacionAlEste

	orientacionActual := OrientacionEste new.! !

!MarsRover methodsFor: 'private' stamp: 't 11/2/2022 17:26:49'!
cambiarOrientacionAlNorte

	orientacionActual := OrientacionNorte new.! !

!MarsRover methodsFor: 'private' stamp: 't 11/2/2022 17:26:58'!
cambiarOrientacionAlOeste

	orientacionActual := OrientacionOeste new.! !

!MarsRover methodsFor: 'private' stamp: 't 11/2/2022 17:26:32'!
cambiarOrientacionAlSur

	orientacionActual := OrientacionSur new.! !

!MarsRover methodsFor: 'private' stamp: 'i 10/30/2022 18:13:34'!
comandoInvalido: unComando
	
	^unComando ~= #L and: [ unComando ~= #R and: [ unComando ~= #F and:[ unComando ~= #B]]].! !

!MarsRover methodsFor: 'private' stamp: 'i 10/30/2022 18:35:09'!
recibirComando: unComando 
	
	unComando = #L ifTrue:[ self rotarALaIzquierda ].
	unComando = #R ifTrue:[ self rotarALaDerecha ].
	unComando = #F ifTrue:[ self avanzar ].
	unComando = #B ifTrue:[ self retroceder ].

	! !

!MarsRover methodsFor: 'private' stamp: 't 11/2/2022 18:09:36'!
retroceder
	
	orientacionActual darDireccionesParaQueRetroceda: self
	! !

!MarsRover methodsFor: 'private' stamp: 't 11/2/2022 18:07:42'!
rotarALaDerecha

	orientacionActual darDireccionesParaQueRoteALaDerecha: self.
! !

!MarsRover methodsFor: 'private' stamp: 't 11/2/2022 18:09:03'!
rotarALaIzquierda
	
	orientacionActual darDireccionesParaQueRoteALaIzquierda: self.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'i 10/30/2022 16:55:53'!
ubicadoEn: aPoint apuntandoA: aSymbol 

	^self new initializeUbicadoEn: aPoint apuntandoA: aSymbol ! !


!classDefinition: #OrientacionDelMarsRover category: 'MarsRover'!
Object subclass: #OrientacionDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!OrientacionDelMarsRover methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:10:31'!
darDireccionesParaQueAvance: unMars

	self subclassResponsibility ! !

!OrientacionDelMarsRover methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:10:57'!
darDireccionesParaQueRetroceda: unMarsRover

	self subclassResponsibility ! !

!OrientacionDelMarsRover methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:11:16'!
darDireccionesParaQueRoteALaDerecha: unMarsRover

	self subclassResponsibility 
! !

!OrientacionDelMarsRover methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:11:38'!
darDireccionesParaQueRoteALaIzquierda: unMarsRover

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionDelMarsRover class' category: 'MarsRover'!
OrientacionDelMarsRover class
	instanceVariableNames: ''!

!OrientacionDelMarsRover class methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 17:41:11'!
conOrientacion: unPuntoCardinal

	| subclaseDetectada |
	
	subclaseDetectada := OrientacionDelMarsRover subclasses detect: [:OrientacionDelMarsRoverSubclass | (OrientacionDelMarsRoverSubclass coincideCon: unPuntoCardinal)].
	
	^subclaseDetectada new.
	! !


!classDefinition: #OrientacionEste category: 'MarsRover'!
OrientacionDelMarsRover subclass: #OrientacionEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!OrientacionEste methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:01:53'!
darDireccionesParaQueAvance: unMarsRover

	unMarsRover avanzarHaciaElEste.! !

!OrientacionEste methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:09:36'!
darDireccionesParaQueRetroceda: unMarsRover

	unMarsRover avanzarHaciaElOeste.! !

!OrientacionEste methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:07:42'!
darDireccionesParaQueRoteALaDerecha: unMarsRover

	unMarsRover cambiarOrientacionAlSur

	! !

!OrientacionEste methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:09:03'!
darDireccionesParaQueRoteALaIzquierda: unMarsRover

	unMarsRover cambiarOrientacionAlNorte.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionEste class' category: 'MarsRover'!
OrientacionEste class
	instanceVariableNames: ''!

!OrientacionEste class methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 17:08:05'!
coincideCon: unPuntoCardinal

	 ^ #E = unPuntoCardinal.! !


!classDefinition: #OrientacionNorte category: 'MarsRover'!
OrientacionDelMarsRover subclass: #OrientacionNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!OrientacionNorte methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:01:53'!
darDireccionesParaQueAvance: unMarsRover

	unMarsRover avanzarHaciaElNorte.! !

!OrientacionNorte methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:09:36'!
darDireccionesParaQueRetroceda: unMarsRover

	unMarsRover avanzarHaciaElSur.! !

!OrientacionNorte methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:07:42'!
darDireccionesParaQueRoteALaDerecha: unMarsRover

	unMarsRover cambiarOrientacionAlEste! !

!OrientacionNorte methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:09:03'!
darDireccionesParaQueRoteALaIzquierda: unMarsRover

	unMarsRover cambiarOrientacionAlOeste.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionNorte class' category: 'MarsRover'!
OrientacionNorte class
	instanceVariableNames: ''!

!OrientacionNorte class methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 17:08:18'!
coincideCon: unPuntoCardinal

	 ^ #N = unPuntoCardinal.! !


!classDefinition: #OrientacionOeste category: 'MarsRover'!
OrientacionDelMarsRover subclass: #OrientacionOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!OrientacionOeste methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:01:53'!
darDireccionesParaQueAvance: unMarsRover

	unMarsRover avanzarHaciaElOeste.! !

!OrientacionOeste methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:09:36'!
darDireccionesParaQueRetroceda: unMarsRover

	unMarsRover avanzarHaciaElEste .! !

!OrientacionOeste methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:07:42'!
darDireccionesParaQueRoteALaDerecha: unMarsRover

	unMarsRover cambiarOrientacionAlNorte! !

!OrientacionOeste methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:09:03'!
darDireccionesParaQueRoteALaIzquierda: unMarsRover

	unMarsRover cambiarOrientacionAlSur.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionOeste class' category: 'MarsRover'!
OrientacionOeste class
	instanceVariableNames: ''!

!OrientacionOeste class methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 17:08:27'!
coincideCon: unPuntoCardinal

	 ^ #O = unPuntoCardinal.! !


!classDefinition: #OrientacionSur category: 'MarsRover'!
OrientacionDelMarsRover subclass: #OrientacionSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!OrientacionSur methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:01:53'!
darDireccionesParaQueAvance: unMarsRover

	unMarsRover avanzarHaciaElSur.! !

!OrientacionSur methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:09:36'!
darDireccionesParaQueRetroceda: unMarsRover

	unMarsRover avanzarHaciaElNorte.! !

!OrientacionSur methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:07:42'!
darDireccionesParaQueRoteALaDerecha: unMarsRover

	unMarsRover cambiarOrientacionAlOeste! !

!OrientacionSur methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 18:09:03'!
darDireccionesParaQueRoteALaIzquierda: unMarsRover

	unMarsRover cambiarOrientacionAlEste.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionSur class' category: 'MarsRover'!
OrientacionSur class
	instanceVariableNames: ''!

!OrientacionSur class methodsFor: 'as yet unclassified' stamp: 't 11/2/2022 17:08:39'!
coincideCon: unPuntoCardinal

	 ^ #S = unPuntoCardinal.! !
