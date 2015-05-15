(require 'asdf)
(asdf:load-system 'inferior-shell)
(asdf:load-system 'cl-inotify)
(use-package :cl-inotify)

;;abort on command failure?
;;can we automatically fork and start in background?
;;how to abort? handle signals?

(defun main (argv) 
	(if (eq 3 (length argv)) 
		(let ((file (elt argv 1)) (cmd (elt argv 2)))
			(write-line (format nil "Will execute ~a once ~a changes" cmd file)
				(with-inotify (inotify T ("/tmp/noti" :modify))
					(do-events (event inotify :blocking-p t)
					(write-line (inferior-shell:run/s cmd))))))
		(write-line (format nil "Usage: ~a fileToWatch commandToExecute" (elt argv 0)))))
