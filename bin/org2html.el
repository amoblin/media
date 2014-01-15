#!/usr/bin/env emacs --batch --script
;; Author: amoblin <amoblin@gmail.com>
;; File Name: org2html.el
;; Create Time: 2013-12-09 17:25
;; This file is created from ~Marboo/media/file_init/default.init.el
;; 本文件由 ~Marboo/media/file_init/default.init.el　复制而来

(defun is-option (str)
  ;; return true if string looks like a command line option
  (string-equal (substring str 0 1) "-"))

(defun get-option (args opt &optional default)
  ;; Return the value of "opt" from "args"; if there is no value for
  ;; "opt" return "default" if provided, otherwise raise an error.
  (or (or (gethash opt args) default)
      (error (format "Error: option -%s is required" opt))))

(defun replace-all (from-str to-str)
  ;; replace all occurrences of from-str with to-str
  (progn
    (beginning-of-buffer)
    (while (search-forward from-str nil t)
      (replace-match to-str nil t))))

;; allows arbitrary command line arguments
(defun do-nothing () t)
(setq command-line-functions '(do-nothing))

;; store option, value pairs in hash-map `args`
(defvar args (make-hash-table :test 'equal))

;; process command-line-args
(setq clargs command-line-args)
(while clargs
  (setq opt (car clargs))
  (setq val (car (cdr clargs)))
  (if (and (is-option opt) (not (is-option val)))
      (puthash (substring opt 1 nil) val args))
  (setq clargs (cdr clargs)))

(setq infile (get-option args "infile"))
(setq outfile (get-option args "outfile"))
(setq infile-temp (make-temp-name "/tmp/org2html-"))
(copy-file infile infile-temp t)
(find-file infile-temp)
(org-mode)
(message "Exporting file:%s to HTML" infile-temp)
(call-interactively 'org-export-as-html )
;(org-export-as-html body-only)
(write-file outfile)
(delete-file infile-temp)

;; References:
;;
;; https://github.com/steshaw/shelly/blob/master/bin/org2html
;; https://github.com/nhoffman/org-export/blob/master/org2html.el