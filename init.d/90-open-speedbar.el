(require 'frame-hooks)

(add-hook 'after-make-window-system-frame-hooks 
          'sr-speedbar-open)
