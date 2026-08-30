(defsystem :lists  
  :description "Lists utilities for general use"
  :author "Stratis Christodoulou <stratis.vip@gmail.com"
  :version "1.0"
  
  :depends-on ()
  :pathname "src"
  :serial t
  
  :components ((:file "package")
               (:file "lists"))

  :in-order-to ((test-op (test-op "lists/tests"))))

(defsystem :lists/tests 
  :description "Test suite for lists"

  :depends-on (:review)
  
  :pathname "tests"
  :serial t
  :components ((:file "package")
               (:file "lists-tests"))
  
   :perform (test-op (op c)
                    (uiop:symbol-call :review :run-tests
                                      ;:show-only-errors t 
                                      ;:color t
				      )))
