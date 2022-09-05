(defun main ()
  (with-open-file (my-stream
                    "nda.txt"
                    :direction :output
                    :if-exists :supersede)
    (princ "Hello Nda san" my-stream)))

(main)
