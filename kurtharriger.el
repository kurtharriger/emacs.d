
(let ((default-directory user-emacs-directory))
      (normal-top-level-add-to-load-path '("."))
      (normal-top-level-add-subdirs-to-load-path))

;; Windowed
(when window-system 
  (require 'alpha)
  (require 'color-theme-ir-black)
  (modify-frame-parameters (selected-frame) '((alpha . 85)))
  (color-theme-ir-black)
  ;;  (global-set-key (kbd "\C-x\C-c") 'save-buffers-kill-emacs)
  (global-unset-key (kbd "\C-x\C-c"))
  (global-set-key (kbd "s-w") 'delete-frame)
  (global-set-key (kbd "s-K") 'server-edit)
  (server-start))

;; MouseTerm
 

(unless window-system
  (xterm-mouse-mode 1)
  (global-set-key [mouse-4] '(lambda ()
                               (interactive)
                               (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                               (interactive)
                               (scroll-up 1))))


(require 'groovy-mode)
