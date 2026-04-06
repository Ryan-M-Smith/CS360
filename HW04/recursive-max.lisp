;;;
;;; Filename: recursive-max.lisp
;;; Description: Recursively find the max element in a list
;;; Author: Ryan Smith (smithrm23@juniata.edu)
;;; Date: 2024-04-06 
;;;

(defun recursive-max (lst)
  "Finds the maximum element in `lst`. Returns `nil` if the list is emp"
  (cond ((null lst) nil)
        ((null (cdr lst)) (car lst))
        ((> (car lst) (recursive-max (cdr lst))) (car lst))
        (t (recursive-max (cdr lst)))))

(print (recursive-max '(1 2 3 4 5)))    ; 5
(print (recursive-max '(4 7 9 1)))      ; 9
(print (recursive-max '(-2 -7 -3 -6)))  ; -2
(print (recursive-max nil))             ; nil