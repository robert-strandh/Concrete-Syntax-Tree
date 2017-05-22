(cl:in-package #:concrete-syntax-tree)

(defparameter *ordinary-required-parameters*
  '((ordinary-required-parameters <-
     (* ordinary-required-parameter))))

(defparameter *ordinay-optional-parameters*
  '((ordinary-optional-parameters <-
     keyword-optional
     (* ordinary-optional-parameter))))

(defparameter *rest-parameter*
  '((rest-parameter <-
     keyword-rest
     simple-variable)))

(defparameter *ordinary-key-parameters*
  '((ordinary-key-parameters <-
     keyword-key
     (* ordinary-key-parameter)
     (? key-allow-other-keys))))

(defparameter *aux-parameters*
  '((aux-parameters <-
     keyword-aux
     (* aux-parameter))))

(defparameter *ordinary-lambda-list*
  '((ordinary-lambda-list <-
     ordinary-required-parameters
     (? ordinary-optional-parameters)
     (? rest-parameter)
     (? ordinary-key-parameters)
     (? aux-parameters))))

(defparameter *generic-function-optional-parameters*
  '((generic-function-optional-parameters <-
     keyword-optional
     (* generic-function-optional-parameter))))

(defparameter *generic-function-key-parameters*
  '((generic-function-key-parameters <-
     keyword-key
     (* generic-function-key-parameter)
     (? key-allow-other-keys))))

(defparameter *generic-function-lambda-list*
  '((generic-function-lambda-list <-
     ordinary-required-parameters
     (? generic-function-optional-parameters)
     (? rest-parameter)
     (? generic-function-key-parameters))))

(defparameter *specialized-required-parameters*
  '((specialized-required-parameters <-
     (* specialized-required-parameter))))

(defparameter *specialized-lambda-list*
  '((specialized-lambda-list <-
     specialized-required-parameters
     (? optional-parameters)
     (? rest-parameter)
     (? key-parameters)
     (? aux-parameters))))

(defparameter *environment-parameter*
  '((environment-parameter <-
     keyword-environment
     simple-variable)))

(defparameter *whole-parameter*
  '((whole-parameter <-
     keyword-whole
     simple-variable)))

(defparameter *standard-grammar*
  (append *ordinary-required-parameters*
	  *ordinay-optional-parameters*
	  *rest-parameter*
	  *ordinary-key-parameters*
	  *aux-parameters*
	  *ordinary-lambda-list*
	  *generic-function-optional-parameters*
	  *generic-function-key-parameters*
	  *generic-function-lambda-list*
	  *specialized-required-parameters*
	  *specialized-lambda-list*
	  *environment-parameter*
	  *whole-parameter*))

(defparameter *ordinary-lambda-list-grammar*
  (cl:cons '(target <- ordinary-lambda-list) *standard-grammar*))

(defparameter *generic-function-lambda-list-grammar*
  (cl:cons '(target <- generic-function-lambda-list) *standard-grammar*))

(defparameter *specialized-lambda-list-grammar*
  (cl:cons '(target <- specialized-lambda-list) *standard-grammar*))
