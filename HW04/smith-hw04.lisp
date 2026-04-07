;;;
;;; Filename: smith-hw04.lisp
;;; Description: LISP code for CS-360 HW04
;;; Author: Ryan Smith (smithrm23@juniata.edu)
;;; Date: 2024-04-07 
;;;

#| -------------------------------------------------------------------------- |#
#|                          Question 2 - Dot Product                          |#
#| -------------------------------------------------------------------------- |#

(defun dot-product (l1 l2)
    "Calculate the dot product of two lists. Returns 0 if `l1` and `l2` are `nil`\, `Invalid length`
    if `l1` and `l2` are different lengths\, and the dot product as an integer otherwise."
    
    (cond
      ((/= (length l1) (length l2)) "Invalid length")
      ((and (null l1) (null l2)) 0)
      (t (+ (* (car l1) (car l2)) (dot-product (cdr l1) (cdr l2))))))

;; Test cases
(print (dot-product '(1 2 3) '(4 5 6)))             ; 32
(print (dot-product '(10 5 34 32) '(78 32 1 56)))   ; 2766
(print (dot-product nil nil))                       ; 0
(print (dot-product '(1 2) '(3 4 5)))               ; "Invalid length"

#| -------------------------------------------------------------------------- |#
#|                    Question 4: Switching between 0 and 1                   |#
#| -------------------------------------------------------------------------- |#

(defun flip-bits (bits)
  "Flip all 0s to 1s and all 1s to 0s in a list of bits. Returns a new list with the flipped bits."
  
  ; Bitwise XOR with 1 flips the bit: 0 XOR 1 = 1, 1 XOR 1 = 0
  (mapcar #'(lambda (b) (logxor b 1)) bits))

;; Test cases
(print (flip-bits '(0 1 0 1 1)))                    ; (1 0 1 0 0)
(print (flip-bits '(1 1 1 0 0)))                    ; (0 0 0 1 1)
(print (flip-bits '(0 0 0 0)))                      ; (1 1 1 1)
(print (flip-bits nil))                             ; nil

#| -------------------------------------------------------------------------- |#
#|            Question 5: Find the max number in a list recursively           |#
#| -------------------------------------------------------------------------- |#

(defun recursive-max (lst)
  "Finds the maximum element in `lst`. Returns `nil` if the list is empty."
  
  (cond
    ((null lst) nil)
    ((null (cdr lst)) (car lst))
    ((> (car lst) (recursive-max (cdr lst))) (car lst))
    (t (recursive-max (cdr lst)))))

;; Test cases
(print (recursive-max '(1 2 3 4 5)))                ; 5
(print (recursive-max '(4 7 9 1)))                  ; 9
(print (recursive-max '(-2 -7 -3 -6)))              ; -2
(print (recursive-max nil))                         ; nil