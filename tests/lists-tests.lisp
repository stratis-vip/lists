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
  (check (equal '(nil) (cartesian-power '() 0)))
  (check-not (cartesian-power '() 1))
  
  )

(test has-more-than-n-p
 
  ;;invalid input retrurn nil
  (check-not (has-more-than-n-p 34 1))
  (check-not (has-more-than-n-p '(3) :b))
  (check-not (has-more-than-n-p '(3) 0))
  (check-not (has-more-than-n-p nil 1))

  ;;n = length list
  (check-not (has-more-than-n-p '(1 2 3 4) 4))
  (check-not (has-more-than-n-p '(1 2 3 4) 5 :equal t))
  (check-not (has-more-than-n-p '(1 2 3 4) 1 :equal t))
  
  (check (has-more-than-n-p '(1 2 3 4) 4 :equal t))
  
  ;;happy end
  (check (has-more-than-n-p (loop for i from 1 to 50000 collect i) 2))
  (check (has-more-than-n-p '(2 3) 1))

  )
;;; LISTS:/tests/lists-tests.lisp ends here 
