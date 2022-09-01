(defparameter *nodes* '((living-room (you are in the living room))
                        (garden (you are in a beatiful garden))
                        (attic (you are in the attic))
                        ))

(defun decribe-location (location nodes)
  (cadr (assoc location nodes)))
 
(print (decribe-location 'living-room *nodes*))

(defparameter *edges* '((living-room (garden west door)
                                     (attic upstairs ladder))
                        (garden (living-room east door))
                        (attic (living-room downstairs ladder))))
(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

(print (describe-paths 'living-room *edges*))

(defparameter *objects* '(whiskey bucket frog chain))

(defparameter *object-location* '((whiskey living-room)
                                  (bucket living-room)
                                  (frog garden)
                                  (chain garden)))

(defun object-at (loc objs obj-locs)
  (labels ((at-loc-p (obj)
             (eq (cadr (assoc obj obj-locs)) loc)))
    (remove-if-not #'at-loc-p objs)))

(print (object-at 'living-room *objects* *object-location*))
