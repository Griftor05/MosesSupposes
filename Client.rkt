;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Client) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require picturing-programs)
(define (keyer x e)
  (cond [(and 
          (or (string? x) (empty? (string->list x)))
          (not (string? (first (string->list e)))))
         (string-append x e)]
        [(equal? e "space") (string-append x " ")]
        [(equal? e "backspace") (string->list x)]))