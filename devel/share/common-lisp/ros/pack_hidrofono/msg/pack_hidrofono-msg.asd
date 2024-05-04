
(cl:in-package :asdf)

(defsystem "pack_hidrofono-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Msg" :depends-on ("_package_Msg"))
    (:file "_package_Msg" :depends-on ("_package"))
  ))