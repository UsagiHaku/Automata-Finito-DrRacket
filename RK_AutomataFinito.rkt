;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ParaMaestro) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define listaTransiciones '( (0 a 1) (0 b 0) (1 a 0) (1 b 1) ))

(define estadosFinales '(1))

(define estadoInicial '(0) )

(define alfabeto '(a b ))

(define listaEstados '(0 1))

(define palabrasIngresada '())

(define estadoActual '())

(define caracter '())

(define palabraIngresada '())

(define primerConjunto '())

(define palabraAcortada palabraIngresada)

(define transiciones listaTransiciones)

(define elemento1 '())
(define elemento2 '())

;3) verifica el estadoActual
(define(verificarEstado )
  (if (eq? estadoActual estadosFinales) (write("Pertenece al lenguaje")) "no pertenece al lenguaje"))



  

;2) creo el primer conjunto conformado por (0,a ) y lo imprimo
(define (analizarConjunto )
  (begin
       
         (write  "holis bolis")
         (write (car transiciones))
        
         (if (eq? (car primerConjunto) (caar transiciones))    
            (if   (eq? (cdr primerConjunto) (car(car(cdr transiciones)))) 
                                                                      (begin
                                                                        (set! estadoActual (car (cdr(cdr transiciones)) )); genero un nuevo estado actual : 1 
                                                                        (set! palabraAcortada (list (cdr palabraAcortada))); acorto la palabra
                                                                        (if (null? palabraAcortada) (verificarEstado)
                                                                            (begin
                                                                              (set! caracter (list (car palabraAcortada ))); obtengo el caracter para el conjunto
                                                                              (set! primerConjunto (append estadoActual caracter)); creo el conjunto
                                                                              (set! transiciones listaTransiciones) ; regreso transiciones a su estado completo
                                                                              (write "como se encontro la transicion, lista queda completa de nuevo->")
                                                                              (write transiciones)
                                                                              (write "<-")
                                                                              (analizarConjunto ); envio nuevo conjunto a analizar

                                                                            ) ))
                                                                      (begin
                                                                         (set! transiciones(list (cdr transiciones)))
                                                                         (analizarConjunto ))
                                                                      )
         (begin
            
                                                                      
                                                                       
              (set! transiciones(list (cdr transiciones)))
              (analizarConjunto )))
  


                                                                      
             ) )
            
;1) leo la palabra y obtengo su primer caracter :a , establezco como estado actual el inicial y por ultimo conjsico el primer conjunto osea (0 a)

(define (ingresarPalabra palabra)
  (begin
        (set! palabraIngresada (list palabra) ) ; abbaab
        (set! estadoActual estadoInicial)  ;0
       
        (set! caracter (list (car palabraIngresada ))); a
        (set! primerConjunto (append estadoActual caracter)); (0 a)
        (write (car transiciones))
        (write (car primerConjunto))
        (analizarConjunto)
     
        
   ))

 








