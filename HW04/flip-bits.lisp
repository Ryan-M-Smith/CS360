;;;
;;; Filename: flip-bits.lisp
;;; Description: Flip all 0s to 1s and all 1s to 0s in a list of bits.
;;; Author: Ryan Smith (smithrm23@juniata.edu)
;;; Date: 2024-04-06
;;;

(defun flip-bits (bits)
  "Flip all 0s to 1s and all 1s to 0s in a list of bits. Returns a new list with the flipped bits."
  ; Bitwise XOR with 1 flips the bit: 0 XOR 1 = 1, 1 XOR 1 = 0
  (mapcar (lambda (b) (logxor b 1)) bits))

(print (flip-bits '(0 1 0 1 1)))    ; (1 0 1 0 0)
(print (flip-bits '(1 1 1 0 0)))    ; (0 0 0 1 1)
(print (flip-bits '(0 0 0 0)))      ; (1 1 1 1)
(print (flip-bits nil))             ; nil