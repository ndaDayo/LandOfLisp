(defparameter *nodes* '((living-room (you are in the living room))
                        (garden (you are in a beatiful garden))
                        (attic (you are in the attic))
                        ))

(defun decribe-location (location nodes)
  (cadr (assoc location nodes)))
 
(print (decribe-location 'living-room *nodes*))
