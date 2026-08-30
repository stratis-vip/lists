;;; file LISTS:/tests/lists-tests.lisp -- Tests file for library Lists 
;;;
;;; Code: 

(in-package :lists/tests)

(clear-suites)
(defsuite lists-tests)
(in-suite lists-tests)

(test sanity-test
      (check t)
      )

(test memberp
  (raise-error (memberp 'a 'b) type-error);;no list error
  (raise-error (memberp 'a 4) type-error)
  (check (memberp 1 '(1)))
  (check (not  (memberp 'a '(b c d))))
  (check (memberp '(1 2) '(a b 3 (1 2) "alfa") :test #'equal))
  (check (memberp  #'oddp (list #'evenp #'oddp)))
  (check (not (memberp 'a '()))))

(test cartesian-power
  ;;power of empty list is empty list
  (check-not (cartesian-power '() 0))
  (check-not (cartesian-power '() 1))
  
  )
;;; LISTS:/tests/lists-tests.lisp ends here 
