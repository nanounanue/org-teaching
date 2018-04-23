(require 'package)
(package-initialize)
;; (setf org-confirm-babel-evaluate nil)
;; no : inline-css as default is better
;;(setf org-html-htmlize-output-type 'css)
;; (setf org-export-time-stamp-file nil)
;; (setf org-export-with-author nil)
;; (setf org-export-with-creator nil)
;; (setf org-export-with-email nil)
;; (load-file "/emacs/ob-blockdiag.el")
;; (prefer-coding-system 'utf-8-unix)
;; Don't prompt for local variables, making them all safe
(setf enable-local-variables :all)
;; Load org-reveal exporter
(require 'ox-reveal)
