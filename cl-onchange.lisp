(asdf:load-system 'cl-inotify)
(use-package :cl-inotify)

;;run command on modification
;;abort on command failure?
;;can we automatically fork and start in background?
(with-inotify (inotify T ("/tmp/noti" :modify))
	(do-events (event inotify :blocking-p t)
		(format t "~a~%" event)))

