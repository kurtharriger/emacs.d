
(let ((default-directory user-emacs-directory))
      (normal-top-level-add-to-load-path '("."))
      (normal-top-level-add-subdirs-to-load-path))

(defvar after-make-console-frame-hooks '()
"Hooks to run after creating a new TTY frame")
(defvar after-make-window-system-frame-hooks '()
"Hooks to run after creating a new window-system frame")

(defun run-after-make-frame-hooks (frame)
"Selectively run either `after-make-console-frame-hooks' or
`after-make-window-system-frame-hooks'"
  (select-frame frame)
  (run-hooks (if window-system
               'after-make-window-system-frame-hooks
               'after-make-console-frame-hooks)))

(add-hook 'after-make-frame-functions 'run-after-make-frame-hooks)
(add-hook 'after-init-hook (lambda ()
  (run-after-make-frame-hooks (selected-frame))))


(setq color-theme-is-global nil)

(add-hook 'after-make-window-system-frame-hooks
          '(lambda ()
             (require 'alpha)
;;             (require 'color-theme-ir-black)
;;             (modify-frame-parameters (selected-frame) '((alpha . 85)))
;;             (color-theme-ir-black)
             ;;  (global-set-key (kbd "\C-x\C-c") 'save-buffers-kill-emacs)
             ;; (global-unset-key (kbd "\C-x\C-c"))
             ;; (global-set-key (kbd "s-w") 'delete-frame)
             ;; (global-set-key (kbd "s-K") 'server-edit)
             ))

(add-hook 'after-make-console-system-frame-hooks
          '(lambda ()
             (xterm-mouse-mode 1)
             (global-set-key [mouse-4] '(lambda ()
                                          (interactive)
                                          (scroll-down 1)))
             (global-set-key [mouse-5] '(lambda ()
                                          (interactive)
                                          (scroll-up 1)))))

(require 'groovy-mode)


(defun my-quit ()
  (interactive)
  (if server-clients
      (do 
          (if server-buffer-clients (server-edit))
          (make-frame-invisible nil t))
      (save-buffers-kill-emacs)))

(defun my-kill ()
  (interactive)
   (if server-buffer-clients       
     (server-edit)
     (ido-kill-buffer)))

(defun my-kill-frame ()
  (interactive)
  (if server-clients
      (do
          (if server-buffer-clients (server-edit))
          (make-frame-invisible nil t))
      (delete-this-frame)))


(global-set-key (kbd "C-x C-c") 'my-quit)
;;(global-set-key (kbd "s-q") 'my-quit)
;;(global-set-key (kbd "C-x 5 0") 'my-kill-frame)
;;(global-set-key (kbd "s-w") 'my-kill-frame)

(add-hook 'server-switch-hook 
  (lambda ()
    (local-set-key (kbd "C-x k") 'my-kill)))

(setq default-major-mode 'org-mode)

;;(unless (and (functionp 'server-running-p)  (server-running-p))
;;  (server-start))


;;(setq mac-option-key-is-meta nil)
;;(setq mac-command-key-is-meta t)
;;(setq mac-command-modifier 'meta)
;;(setq mac-option-modifier nil)

(require 'jde)



