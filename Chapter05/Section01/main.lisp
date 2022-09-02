(defparameter *nodes* '((living-room (you are in the living room))
                        (garden (you are in a beatiful garden))
                        (attic (you are in the attic))
                        ))

(defun describe-location (location nodes)
  (cadr (assoc location nodes)))
 
(print (describe-location 'living-room *nodes*))

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

(defun describe-objects (loc objs obj-loc)
  (labels ((describe-obj (obj)
             `(you see a, obj on the floor.)))
    (apply #'append (mapcar #'describe-obj (object-at loc objs obj-loc)))))

(print (describe-objects 'living-room *objects* *object-location*))

(defparameter *location* 'living-room)

(defun look ()
  (append (describe-location *location* *nodes*)
          (describe-paths *location* *edges*)
          (describe-objects *location* *objects* *object-location*)))

(print (look))

(defun walk (direction)
  (let ((next (find direction 
                    (cdr (assoc *location* *edges*))
                    :key #'cadr)))
    (if next
        (progn (setf *location* (cdr next))
               (look))
        '(you cannot go...))))

(print (walk 'east))

(defun pickup (object)
  (cond ((member object
                 (object-at *location* *objects* *object-location*))
         (push (list object 'body) *object-location*)
         `(you are now carrying the , object))
        (t '(you cannot get that.))))

(print (pickup 'whiskey))

(defun inventory ()
  (cons 'items- (object-at 'body *objects* *object-location*)))

(print (inventory))
