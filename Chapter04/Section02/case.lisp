(defun is-nda (name)
  (case name
    ((nda) '(nda-dayo))
    ((dayo) '(dayo-yooo))
    (otherwise '(nda dewa naiyo))))


(print (is-nda 'nda))

(print (is-nda 'dayoooo))
