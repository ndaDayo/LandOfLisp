(defun main ()
  (substitute-if "nda" #'oddp '(1 2 3 4 5 6)))

(print (main))
