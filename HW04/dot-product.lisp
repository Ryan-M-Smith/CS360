;;;
;;; Filename: dot-product.lisp
;;; Description: Calculate the dot product of two lists.
;;; Author: Ryan Smith (smithrm23@juniata.edu)
;;; Date: 2024-04-06 
;;;

(defun dot-product (l1 l2)
    "Calculate the dot product of two lists. Returns 0 if `l1` and `l2` are `nil`\, `Invalid length`
    if `l1` and `l2` are different lengths\, and the dot product as an integer otherwise."
    
    (cond
      ((/= (length l1) (length l2)) "Invalid length")
      ((and (null l1) (equal nil l2)) 0)
      (t (+ (* (car l1) (car l2)) (dot-product (cdr l1) (cdr l2))))))

(print (dot-product '(1 2 3) '(4 5 6)))             ; 32
(print (dot-product '(10 5 34 32) '(78 32 1 56)))   ; 2766
(print (dot-product nil nil))                       ; 0
(print (dot-product '(1 2) '(3 4 5)))               ; "Invalid length"