
(require 'color-theme-ir-black)
(color-theme-ir-black)

(global-set-key (kbd "\C-x\C-c") 'save-buffers-kill-emacs)

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "s-w") 'kill-current-buffer)

