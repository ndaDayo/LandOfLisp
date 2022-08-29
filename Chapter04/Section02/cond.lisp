(defvar *arch-enemy* nil)

(defun pudding-eater (person)
  (cond ((eq person 'nda) (setf *arch-enemy* 'stupid-lisp-alian)
                          '(course you lisp alian))
        ((eq person 'dayo) (setf *arch-enemy* 'dayo)
                           '(i hope you dayo))
        (t                 '(why you eat my pudding staranger?))
        ))

(print (pudding-eater 'nda))

(print (pudding-eater 'dayo))

(print (pudding-eater 'sugawara))
