;;; file LISTS:src/package.lisp -- exports from package lists
;;; 
;;; Code: 
;;; 

(defpackage :lists
 (:use :cl)
 (:export
  :memberp ;✓
  :has-no-duplicates-p ;✓
  :cartesian-power ;✓
  :cartesian-product ;✓
  :permutations-without-replacement ;✓
  :power-set ;✓

  :has-more-than-n-p ;✓
  :is-list-of-p ;✓
  :combine-all-predicates ;✓
  :combine-any-predicates ;✓
  :combine-all-predicates ;✓
   )) 

;;; LISTS:src/package.lisp ends here
