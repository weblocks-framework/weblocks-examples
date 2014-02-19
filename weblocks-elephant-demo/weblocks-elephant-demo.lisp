
(defpackage #:weblocks-elephant-demo
  (:use :cl :weblocks :metatilities :weblocks-elephant)
  (:documentation
   "A web application based on Weblocks and Elephant."))

(in-package :weblocks-elephant-demo)

(export '(start-weblocks-elephant-demo stop-weblocks-elephant-demo))

;; Define our application
(defwebapp weblocks-elephant-demo
    :description "A web application based on Weblocks using elephant store"
    :autostart nil
    :init-user-session  'init-user-session
    :dependencies
    '((:stylesheet "suggest")))


(defun start-weblocks-elephant-demo (&rest args)
  "Starts the application by calling 'start-weblocks' with appropriate
arguments."
  (let ((app-args (when (getf args :prefix) 
                    (prog1 
                      (list :prefix (getf args :prefix)) 
                      (remf args :prefix)))))
    (apply #'start-weblocks args)
    (apply #'start-webapp (list* 'weblocks-elephant-demo app-args))))

(defun stop-weblocks-elephant-demo ()
  "Stops the application by calling 'stop-weblocks'."
  (stop-weblocks))

