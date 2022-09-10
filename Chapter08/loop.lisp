(defun main ()
  (loop repeat 10
        collect "nda"))

(defun one-to-hundred ()
  (loop for n from 1 to 100
        collect n))

(princ (one-to-hundred))
