(defparameter *nodes* '((living-room (you are in the living room))
                        (garden (you are in a beatiful garden))
                        (attic (you are in the attic))
                        ))

(defun describe-location (location nodes)
  (cadr (assoc location nodes)))
 
(defparameter *edges* '((living-room (garden west door)
                                     (attic upstairs ladder))
                        (garden (living-room east door))
                        (attic (living-room downstairs ladder))))
(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

(defparameter *objects* '(whiskey bucket frog chain))

(defparameter *object-location* '((whiskey living-room)
                                  (bucket living-room)
                                  (frog garden)
                                  (chain garden)))

(defun object-at (loc objs obj-locs)
  (labels ((at-loc-p (obj)
             (eq (cadr (assoc obj obj-locs)) loc)))
    (remove-if-not #'at-loc-p objs)))

(defun describe-objects (loc objs obj-loc)
  (labels ((describe-obj (obj)
             `(you see a, obj on the floor.)))
    (apply #'append (mapcar #'describe-obj (object-at loc objs obj-loc)))))

(defparameter *location* 'living-room)

(defun look ()
  (append (describe-location *location* *nodes*)
          (describe-paths *location* *edges*)
          (describe-objects *location* *objects* *object-location*)))

(defun walk (direction)
  (let ((next (find direction 
                    (cdr (assoc *location* *edges*))
                    :key #'cadr)))
    (if next
        (progn (setf *location* (cdr next))
               (look))
        '(you cannot go...))))

(defun pickup (object)
  (cond ((member object
                 (object-at *location* *objects* *object-location*))
         (push (list object 'body) *object-location*)
         `(you are now carrying the , object))
        (t '(you cannot get that.))))

(defun inventory ()
  (cons 'items- (object-at 'body *objects* *object-location*)))

(defun game-repl ()
  (let ((cmd (game-read)))
    (unless (eq (car cmd)) 'quit)
    (game-print (game-eval cmd))
    (game-repl)))

(defun game-read ()
  (let ((cmd (read-from-string
               (concatenate 'string "(" (read-line) ")"))))
    (flet ((quote-it (x)
             (list 'quote x)))
      (cons (car cmd) (mapcar #'quote-it (cdr cmd))))))

(defparameter *allowd-commands* '(look walk pickup inventory))

(defun game-eval (sexp)
  (if (member (car sexp) *allowd-commands*)
      (eval sexp)
      '(i dont know that commnad. )))




