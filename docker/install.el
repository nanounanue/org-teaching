(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-refresh-contents)
(package-initialize)
(package-install 'org-plus-contrib)
(package-install 'htmlize)
;(package-install 'json-mode)
;(package-install 'erlang)
(package-install 'ox-reveal)

;; not using org-beautify as it renders better with X. Instead use custom faces (see export.el)
;(package-install 'org-beautify-theme)
;(load-theme 'org-beautify t)