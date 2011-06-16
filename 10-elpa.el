(add-to-list 'load-path (concat dotfiles-dir "elpa"))
(require 'package)

(add-to-list 'package-archives  '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
