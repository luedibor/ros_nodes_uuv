;; Auto-generated. Do not edit!


(when (boundp 'pack_hidrofono::Msg)
  (if (not (find-package "PACK_HIDROFONO"))
    (make-package "PACK_HIDROFONO"))
  (shadow 'Msg (find-package "PACK_HIDROFONO")))
(unless (find-package "PACK_HIDROFONO::MSG")
  (make-package "PACK_HIDROFONO::MSG"))

(in-package "ROS")
;;//! \htmlinclude Msg.msg.html


(defclass pack_hidrofono::Msg
  :super ros::object
  :slots (_stamp _data _w ))

(defmethod pack_hidrofono::Msg
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:data __data) 0)
    ((:w __w) 0.0)
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _data (round __data))
   (setq _w (float __w))
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; int32 _data
    4
    ;; float64 _w
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; int32 _data
       (write-long _data s)
     ;; float64 _w
       (sys::poke _w (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _data
     (setq _data (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _w
     (setq _w (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get pack_hidrofono::Msg :md5sum-) "d1a0a03e61926fba0da2daab36f5346a")
(setf (get pack_hidrofono::Msg :datatype-) "pack_hidrofono/Msg")
(setf (get pack_hidrofono::Msg :definition-)
      "time stamp
int32 data   
float64 w   
")



(provide :pack_hidrofono/Msg "d1a0a03e61926fba0da2daab36f5346a")


