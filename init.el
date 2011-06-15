;; init.el -- bootstap customizations

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Automatically load all .el files in this directory.
(add-to-list 'load-path dotfiles-dir)
(mapc #'load (remove "init.el" 
	      (directory-files dotfiles-dir nil "^[^.].*el$")))


;; DO NOT MODIFY THIS FILE 
;; Instead of copying and pasting snippets of elisp,
;; lets at the very least increase the distribution 
;; unit to an entire file.  Ideally lets build a 
;; community around elpa and mamalade to share common
;; features. 
;; 
;; To add additional customizations create a new file ending in .el
;; in the current directory and it will be loaded automatically.

;; end init.el

