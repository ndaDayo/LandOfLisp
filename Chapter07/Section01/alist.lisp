(defparameter *drink-order* '((bill . espresso)
                              (lisa . small-drip)
                              (john . latte)))
(print (assoc 'lisa *drink-order*))
