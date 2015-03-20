;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Client) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require picturing-programs)
(define (back-space x)
  (list->string (reverse (rest (reverse (string->list x))))))
(define (keyer x e)
  (cond [(and 
          (or (string? x) (empty? (string->list x)))
          (empty? (rest (string->list e))))
         (string-append x e)]
        [(equal? e #\space) (string-append x " ")]
        [(equal? e #\backspace) (back-space x)]
        [(equal? e "enter") (string->list x)]
        [else x]))
(define (drawer x)
  (overlay (text x 15 "black") (rectangle 900 900 "solid" "white")))
(big-bang ""
          (on-key keyer)
          (on-draw drawer))
(check-expect (back-space "run durmn") "run durm")
