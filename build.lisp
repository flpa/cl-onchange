(defun main (argv) 
	(if (eq 3 (length argv)) 
		(write-line (format nil "Will execute ~a once ~a changes" (elt argv 2) (elt argv 1))) 
		(write-line (format nil "Usage: ~a fileToWatch commandToExecute" (elt argv 0)))))
