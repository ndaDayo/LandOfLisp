(defun main ()
  (remove-if #'oddp '(1 2 3 4 5 5 61 )))

(princ (main))
