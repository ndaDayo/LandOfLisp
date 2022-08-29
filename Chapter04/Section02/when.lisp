(defvar *number-is-odd* nil)

(when (oddp 77)
  (setf *number-is-odd* t)
  'odd-num)

(print *number-is-odd*)
