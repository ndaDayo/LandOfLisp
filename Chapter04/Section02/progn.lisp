(defvar *number-was-odd* nil)

(defun main ()
  (if (oddp 5) 
      (progn (setf *number-was-odd* t)
             'odd-num)
      'even-num
      ))

(print (main))

(print *number-was-odd*)
