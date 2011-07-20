(require 'frame-hooks)
(setq color-theme-is-global nil)

(add-hook 'after-make-window-system-frame-hooks
          '(lambda ()
             (require 'alpha)
             (require 'color-theme-ir-black)
             (color-theme-ir-black)))

