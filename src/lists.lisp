;;; file LISTS:src/lists.lisp -- Lists utilities file 
;;; 
;;; Code: 
;;; 

(in-package :lists)


(defun memberp (item lst &key (test #'eql))
  "Check if ITEM is in LST against TEST function.

   ITEM any value
   LST a list of any type
   TEST the equality function

   Returns T if item is in the LST. Else NIL or TYPE-ERROR if no list or no-function given."
  (check-type lst list)
  (check-type test function)

  (when lst
    (or (funcall test item (first lst))
        (memberp item (rest lst) :test test))))

(defun cartesian-power (lst n)
  "Returns a list with all possibles lists from itesm of LST with length N.
   Items can repeated!

   EXAMPLE (cartesian-power '(1 2) 3) => ((1 1 1) (1 1 2) (1 2 1) (1 2 2)
                                         (2 1 1) (2 1 2) (2 2 1) (2 2 2))

   Raise an error if not valid types provided."
  (check-type lst list)
  (check-type n (integer 0))
  (if (zerop n)
      (list '())
      (let ((smaller (cartesian-power lst (1- n))))
        (mapcan (lambda (x)
                  (mapcar (lambda (seq) (cons x seq))  smaller))
                lst))))

(defun cartesian-product (&rest lsts)
  "Επιστρέφει όλους του πιθανούς συνδυασμούς των στοιχείων των LSTS "
  (dolist (lst lsts)
    (check-type lst list))
  (if (null lsts)
      (list nil)
      (mapcan (lambda (element)
                (mapcar (lambda (next-element)
                          (cons element next-element))
                        (apply #'cartesian-product (cdr lsts))))
              (car lsts))))

(defun permutations-without-replacement (lst n &key (test #'eql))
  "Επιστρέφει λίστα με όλες τις διατεταγμένες ακολουθίες (ως λίστες) μήκους N
   από στοιχεία του LST, ΧΩΡΙΣ επανατοποθέτηση (κάθε στοιχείο χρησιμοποιείται
   το πολύ μία φορά ανά ακολουθία). Αν N > (length LST), επιστρέφει NIL."
  (check-type lst list)
  (check-type n (integer 0))
  (if (zerop n)
      (list '())
      (mapcan (lambda (x)
                (mapcar (lambda (seq) (cons x seq))
                        (permutations-without-replacement
                         (cl:remove x lst :count 1 :test test)
                         (1- n)
                         :test test)))
              lst)))
;;; LISTS:src/lists.lisp ends here
