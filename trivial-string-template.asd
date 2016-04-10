#|
  This file is a part of trivial-string-template project.
  Copyright (c) 2016 David Guru (david_guru@gty.org.in)
|#

#|
  A trivial string template library, inspired by Python's string.Template

  Author: David Guru (david_guru@gty.org.in)
|#

(in-package :cl-user)
(defpackage #:trivial-string-template-asd
  (:use #:cl #:asdf))
(in-package #:trivial-string-template-asd)

#+allegro (require :regexp2)


(defsystem trivial-string-template
  :version "0.1"
  :author "David Gu"
  :license "MIT"
  :depends-on (#:alexandria
               #:proc-parse
               #:closer-mop
               #-allegro #:cl-ppcre)
  :components ((:module "src"
                :components
                ((:file "trivial-string-template"))))
  :description "A trivial string template library, inspired by Python's string.Template"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op trivial-string-template-test))))
