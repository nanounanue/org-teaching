(require 'package)
(package-initialize)

;; Set some faces for htmlize (see
;; http://sebastien.kirche.free.fr/emacs_stuff/elisp/my-htmlize.el,
;; via https://stackoverflow.com/a/33687588/1814910)

(custom-set-faces 
 '(default                      ((t (:foreground "#ffffff" :background "black"))))
 '(font-lock-builtin-face       ((t (:foreground "#ff0000"))))
 '(font-lock-comment-face       ((t (:bold t :foreground "#333300"))))
 '(font-lock-constant-face      ((t (:foreground "magenta"))))
 '(font-lock-function-name-face ((t (:bold t :foreground "Blue"))))
 '(font-lock-keyword-face       ((t (:foreground "yellow3"))))
 '(font-lock-string-face        ((t (:foreground "light blue"))))
 '(font-lock-type-face      ((t (:foreground "green"))))
 '(font-lock-variable-name-face ((t (:foreground "cyan" :bold t))))
 '(font-lock-warning-face       ((t (:foreground "red" :weight bold)))))

(setq htmlize-use-rgb-map 'force)

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
