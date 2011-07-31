
(setq vendor-dir (concat dotfiles-dir "vendor"))

(when (file-directory-p vendor-dir)
  (let ((vendor-dirs (directory-files vendor-dir nil "^[^.]")))
    (dolist (dir vendor-dirs) 
      (add-to-list 'load-path (expand-file-name dir vendor-dir)))
    (mapc 'require (mapcar 'intern vendor-dirs))))
       

