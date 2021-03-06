(cl:in-package #:concrete-syntax-tree)

(defclass cons-cst (cst)
  (;; This slot contains a CST that represents the CAR of the
   ;; corresponding expression.
   (%first :initform nil :initarg :first :reader first)
   ;; This slot contains a CST that represents the CDR of the
   ;; corresponding expression.
   (%rest :initform nil :initarg :rest :reader rest)))

(defmethod consp ((cst cons-cst))
  (declare (ignorable cst))
  t)

(defgeneric cons (first rest &key source))

(defun raw-or-nil (cst)
  (raw cst))

(defmethod cons (first rest &key source)
  (make-instance 'cons-cst
                 :raw (cl:cons (raw-or-nil first) (raw-or-nil rest))
                 :source source
                 :first first
                 :rest rest))

(defun list (&rest csts)
  (loop for result = (make-instance 'atom-cst :raw nil) then (cons cst result)
        for cst in (reverse csts)
        finally (return result)))

(defgeneric nthrest (n cst)
  (:method (n (cst cons-cst))
    (loop for tail = cst then (rest tail)
          repeat n
          finally (return tail))))

(defgeneric nth (n cst)
  (:method (n (cst cons-cst))
    (first (nthrest n cst))))

(defgeneric second (cst)
  (:method ((cst cons-cst))
    (nth 1 cst)))

(defgeneric third (cst)
  (:method ((cst cons-cst))
    (nth 2 cst)))

(defgeneric fourth (cst)
  (:method ((cst cons-cst))
    (nth 3 cst)))

(defgeneric fifth (cst)
  (:method ((cst cons-cst))
    (nth 4 cst)))

(defgeneric sixth (cst)
  (:method ((cst cons-cst))
    (nth 5 cst)))

(defgeneric seventh (cst)
  (:method ((cst cons-cst))
    (nth 6 cst)))

(defgeneric eighth (cst)
  (:method ((cst cons-cst))
    (nth 7 cst)))

(defgeneric ninth (cst)
  (:method ((cst cons-cst))
    (nth 8 cst)))

(defgeneric tenth (cst)
  (:method ((cst cons-cst))
    (nth 9 cst)))
