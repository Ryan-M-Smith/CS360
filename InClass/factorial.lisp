(defun factorial (n)
  "Take the factorial of a number n."
  (cond
      ((= n 0) 1)
      ((= n 1) 1)
      ((> n 1) (* n (factorial (- n 1))))
      ((< n 0) NIL)
  )
)

(print (factorial 0))     ; 1
(print (factorial 1))     ; 1
(print (factorial -5))    ; NIL 
(print (factorial 8))     ; 40320
